Name = "backgroundSelector"
NamePretty = "Background Selector"
Cache = false
HideFromProviderlist = false
SearchName = true

local function ShellEscape(s)
  return "'" .. s:gsub("'", "'\\''") .. "'"
end

function FormatName(filename)
  local name = filename:gsub("^%d+", ""):gsub("^%-", "")
  name = name:gsub("%.[^%.]+$", "")
  name = name:gsub("[-_]", " ")
  name = name:gsub("%S+", function(word)
    return word:sub(1, 1):upper() .. word:sub(2):lower()
  end)
  return name
end

function GetEntries()
  local entries = {}
  local home = os.getenv("HOME")

  local wallpaper_dir = home .. "/.config/swaybg/backgrounds"
  local target_dir = home .. "/.config/swaybg/current"
  local target_file = target_dir .. "/current.png"

  local seen = {}

  local handle = io.popen(
    "/run/current-system/sw/bin/find -L " .. ShellEscape(wallpaper_dir)
    ..
    " -maxdepth 1 -type f \\( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' \\) 2>/dev/null | sort"
  )

  if handle then
    for background in handle:lines() do
      local filename = background:match("([^/]+)$")
      if filename and not seen[filename] then
        seen[filename] = true

        -- Create the shell command sequence
        local cmd = "mkdir -p " .. ShellEscape(target_dir) ..
            " && cp " .. ShellEscape(background) .. " " .. ShellEscape(target_file) ..
            " && pkill swaybg; swaybg -i " .. ShellEscape(target_file) .. " -m fill &"

        table.insert(entries, {
          Text = FormatName(filename),
          Value = background,
          Actions = {
            activate = cmd
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
