Name = "backgroundSelector"
NamePretty = "Background Selector"
Cache = false
HideFromProviderlist = false -- Set to false if you want it visible in your general providers list
SearchName = true

local function ShellEscape(s)
  return "'" .. s:gsub("'", "'\\''") .. "'"
end

function FormatName(filename)
  -- Remove leading number and dash
  local name = filename:gsub("^%d+", ""):gsub("^%-", "")
  -- Remove extension
  name = name:gsub("%.[^%.]+$", "")
  -- Replace dashes and underscores with spaces
  name = name:gsub("[-_]", " ")
  -- Capitalize each word
  name = name:gsub("%S+", function(word)
    return word:sub(1, 1):upper() .. word:sub(2):lower()
  end)
  return name
end

function GetEntries()
  local entries = {}
  local home = os.getenv("HOME")

  -- The agnostic directory you want to use
  local wallpaper_dir = home .. "/.config/swaybg/backgrounds"

  -- Track added files to avoid duplicates (safeguard)
  local seen = {}

  local handle = io.popen(
    "find -L " .. ShellEscape(wallpaper_dir)
    ..
    " -maxdepth 1 -type f \\( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' \\) 2>/dev/null | sort"
  )

  if handle then
    for background in handle:lines() do
      local filename = background:match("([^/]+)$")
      if filename and not seen[filename] then
        seen[filename] = true
        table.insert(entries, {
          Text = FormatName(filename),
          Value = background,
          Actions = {
            -- Ensures old swaybg instances are killed before drawing the new one
            activate = "pkill swaybg; swaybg -i " .. ShellEscape(background) .. " -m fill &"
          },
          Preview = background,
          PreviewType = "file",
        })
      end
    end
    handle:close()
  end

  return entries
end
