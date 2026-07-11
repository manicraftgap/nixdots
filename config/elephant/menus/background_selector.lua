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
  local wallpaper_dir = home .. "/.config/swaybg/backgrounds"
  local seen = {}

  local current_path = os.getenv("PATH") or ""
  local nix_paths = "/run/current-system/sw/bin:" .. os.getenv("HOME") .. "/.nix-profile/bin"
  local cmd_prefix = "PATH=" .. nix_paths .. ":" .. current_path .. " "

  local handle = io.popen(
    cmd_prefix .. "find -L " .. ShellEscape(wallpaper_dir)
    ..
    " -maxdepth 1 -type f \\( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif' -o -name '*.bmp' -o -name '*.webp' \\) 2>/dev/null | " ..
    cmd_prefix .. "sort"
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
            activate = cmd_prefix ..
            "pkill swaybg; " .. cmd_prefix .. "swaybg -i " .. ShellEscape(background) .. " -m fill &"
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
