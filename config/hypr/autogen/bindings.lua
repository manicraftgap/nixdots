-- ~/.config/hypr/bindings.lua
local mainMod = "SUPER"

-- --- Application Bindings ---
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + ALT + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec tmux new"))

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
hl.bind(mainMod .. " + mouse:272", function() hl.dsp.window.move() end, { mouse = true })
hl.bind(mainMod .. " + mouse:273", function() hl.dsp.window.resize() end, { mouse = true })

-- === Utilities & Walkers ===
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("walker"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("walker -m symbols"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))

-- Waybar Toggle (Inlined script logic)
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd([[
  if pgrep -x waybar >/dev/null; then
    pkill -x waybar
  else
    uwsm-app -- waybar >/dev/null 2>&1 &
  fi
]]))

-- Keybindings Helper (Inlined parser + walker dmenu launcher)
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd([[
  HEIGHT=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .height')
  MENU_HEIGHT=$((HEIGHT * 40 / 100))
  
  hyprctl -j binds | jq -r '.[] | {modmask, key, keycode, description, dispatcher, arg} | "\(.modmask),\(.key)@\(.keycode),\(.description),\(.dispatcher),\(.arg)"' | sed -r \
    -e 's/null//' -e 's,uwsm app -- ,,' -e 's,uwsm-app -- ,,' -e 's/@0//' -e 's/,@/,code:/' -e 's/^0,/,/' -e 's/^1,/SHIFT,/' -e 's/^4,/CTRL,/' -e 's/^5,/SHIFT CTRL,/' -e 's/^8,/ALT,/' -e 's/^9,/SHIFT ALT,/' -e 's/^12,/CTRL ALT,/' -e 's/^13,/SHIFT CTRL ALT,/' -e 's/^64,/SUPER,/' -e 's/^65,/SUPER SHIFT,/' -e 's/^68,/SUPER CTRL,/' -e 's/^69,/SUPER SHIFT CTRL,/' -e 's/^72,/SUPER ALT,/' -e 's/^73,/SUPER SHIFT ALT,/' -e 's/^76,/SUPER CTRL ALT,/' -e 's/^77,/SUPER SHIFT CTRL ALT,/' | \
  awk -F, '{
    combo = $1 " + " $2; gsub(/^[ \t]*\+?[ \t]*/, "", combo); gsub(/[ \t]+$/, "", combo);
    act = $3; if (act == "") { for (i = 4; i <= NF; i++) act = act $i (i < NF ? "," : ""); sub(/,$/, "", act); gsub(/(^|,)[[:space:]]*exec[[:space:]]*,?/, "", act); gsub(/^[ \t]+|[ \t]+$/, "", act); gsub(/[ \t]+/, " ", combo); }
    if (act != "") printf "%-35s → %s\n", combo, act
  }' | sort -u | walker --dmenu -p 'Keybindings' --width 800 --height "$MENU_HEIGHT"
]]))

-- Aesthetics & Screen Control (Inlined Nightlight toggle logic)
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd([[
  if ! pgrep -x hyprsunset >/dev/null; then
    setsid uwsm-app -- hyprsunset & sleep 0.5
  fi
  TEMP=$(hyprctl hyprsunset temperature 2>/dev/null | grep -oE '[0-9]+')
  if [ "$TEMP" = "6000" ] || [ -z "$TEMP" ]; then
    hyprctl hyprsunset temperature 4000 && notify-send -u low "  Nightlight screen temperature"
  else
    hyprctl hyprsunset temperature 6000 && notify-send -u low "   Daylight screen temperature"
  fi
]]))

-- Screenshots / Captures (Self-contained pipeline replacing script logic)
local screenshot_cmd = [[
  DIR="$HOME/Pictures"
  mkdir -p "$DIR"
  pkill slurp && exit 0
  
  WS=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')
  RECTS=$( (hyprctl monitors -j | jq -r --arg ws "$WS" '.[] | select(.activeWorkspace.id == ($ws | tonumber)) | "\(.x),\(.y) \((.width / .scale | floor))x\((.height / .scale | floor))"'; hyprctl clients -j | jq -r --arg ws "$WS" '.[] | select(.workspace.id == ($ws | tonumber)) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"') )
  
  hyprpicker -r -z >/dev/null 2>&1 & PICKER_PID=$!
  sleep .1
  SELECTION=$(echo "$RECTS" | slurp 2>/dev/null)
  kill $PICKER_PID 2>/dev/null
  
  if [ -n "$SELECTION" ]; then
    FILE="$DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
    grim -g "$SELECTION" "$FILE" && wl-copy < "$FILE"
    notify-send "Screenshot saved to clipboard and file" "Saved inside: ~/Pictures" -t 4000 -i "$FILE"
  fi
]]

hl.bind("PRINT", hl.dsp.exec_cmd(screenshot_cmd))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot_cmd))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- Notifications (Mako)
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"))
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("makoctl invoke"))
hl.bind(mainMod .. " + SHIFT + ALT + COMMA", hl.dsp.exec_cmd("makoctl restore"))

-- Zoom
hl.bind(mainMod .. " + CTRL + Z",
  hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')"))
hl.bind(mainMod .. " + CTRL + ALT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- Lock System
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
