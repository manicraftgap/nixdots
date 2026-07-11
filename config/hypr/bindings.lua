-- ~/.config/hypr/bindings.lua
local mainMod = "SUPER"

-- --- Application Bindings ---
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + ALT + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec tmux new"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("uwsm-app -- hyprlock"))
hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd("ghostty --title=wiremix -e wiremix"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("ghostty --title=bluetui -e bluetui"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("ghostty --title=impala -e impala"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("ghostty --title=btop -e btop"))

-- Web Browser
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-open 'https://'"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("uwsm-app -- xdg-open 'https://'"))
hl.bind(mainMod .. " + SHIFT + ALT + B", hl.dsp.exec_cmd("uwsm-app -- xdg-open --incognito 'https://'"))

-- File Manager
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"))
hl.bind(mainMod .. " + ALT + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window ~"))

-- Multimedia / System TUI Launchers
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm-app -- flatpak run com.github.neithern.g4music"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec lazydocker"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("uwsm-app -- signal-desktop"))

-- --- Screenshots ---
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g '$(slurp)' - | wl-copy"))

-- --- Web Applications ---
hl.bind(mainMod .. " + SHIFT + ALT + A", hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://chatgpt.com"]]))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://perplexity.ai"]]))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://youtube.com/"]]))
hl.bind(mainMod .. " + SHIFT + CTRL + G",
  hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://messages.google.com/web/conversations"]]))

-- --- Window Resizing ---
local resizeUnit = 30
hl.bind(mainMod .. " + SHIFT + ALT + right", hl.dsp.window.resize({ x = resizeUnit, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + left", hl.dsp.window.resize({ x = -resizeUnit, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + up", hl.dsp.window.resize({ x = 0, y = -resizeUnit, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + down", hl.dsp.window.resize({ x = 0, y = resizeUnit, relative = true }))

-- === Universal Clipboard ===
hl.bind(mainMod .. " + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert", window = "activewindow" }))
hl.bind(mainMod .. " + V", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert", window = "activewindow" }))
hl.bind(mainMod .. " + X", hl.dsp.send_shortcut({ mods = "CTRL", key = "X", window = "activewindow" }))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("walker -m clipboard"))

-- === Media & Brightness ===
-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"))
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 100%"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1%"))
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +1%"))
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1%-"))

-- Media Playback
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Hyprsunset Toggle --
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd([[
  export PATH=$PATH:/run/current-system/sw/bin:$HOME/.nix-profile/bin

  if pgrep -x hyprsunset >/dev/null; then
    pkill -x hyprsunset
    notify-send -u low "   Daylight screen temperature"
  else
    hyprsunset -t 4000 &
    notify-send -u low "  Nightlight screen temperature"
  fi

  if grep -q "custom/nightlight" ~/.config/waybar/config.jsonc; then
    pkill -SIGUSR2 waybar
  fi
]]))

-- === Window Management & Tiling ===
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Focus
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

-- Workspaces (1-10)
for i = 1, 9 do
  local ws = tostring(i)
  hl.bind(mainMod .. " + " .. ws, hl.dsp.focus({ workspace = ws }))
  hl.bind(mainMod .. " + SHIFT + " .. ws, hl.dsp.window.move({ workspace = ws, follow = true }))
  hl.bind(mainMod .. " + SHIFT + ALT + " .. ws, hl.dsp.window.move({ workspace = ws, follow = false }))
end

-- Workspace 10 (0 Keybind)
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10", follow = true }))
hl.bind(mainMod .. " + SHIFT + ALT + 0", hl.dsp.window.move({ workspace = "10", follow = false }))

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Workspace Cycling
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Swap Windows
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.swap({ direction = "down" }))

-- Window Grouping
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + G", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + ALT + LEFT", hl.dsp.window.move({ into_group = "left" }))
hl.bind(mainMod .. " + ALT + RIGHT", hl.dsp.window.move({ into_group = "right" }))
hl.bind(mainMod .. " + ALT + UP", hl.dsp.window.move({ into_group = "up" }))
hl.bind(mainMod .. " + ALT + DOWN", hl.dsp.window.move({ into_group = "down" }))
hl.bind(mainMod .. " + ALT + TAB", hl.dsp.group.active({ index = 1 }))
hl.bind(mainMod .. " + ALT + SHIFT + TAB", hl.dsp.group.active({ index = -1 }))

-- Move/Resize with Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- === Utilities & Walkers ===
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("walker"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("walker -m symbols"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))

-- Screenshots / Captures
hl.bind("PRINT", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- Notifications (Mako)
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"))
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("makoctl invoke"))
hl.bind(mainMod .. " + SHIFT + ALT + COMMA", hl.dsp.exec_cmd("makoctl restore"))

-- Zoom
hl.bind(mainMod .. " + CTRL + Z",
  hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')"))
hl.bind(mainMod .. " + CTRL + ALT + Z", hl.dsp.exec_cmd("hyprlock"))
