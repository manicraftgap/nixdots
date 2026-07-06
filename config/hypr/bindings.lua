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

-- === Window Management & Tiling ===
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.fullscreen("0"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.fullscreen("2"))
hl.bind(mainMod .. " + ALT + F", hl.dsp.fullscreen("1"))

-- Focus
hl.bind(mainMod .. " + LEFT", hl.dsp.movefocus("l"))
hl.bind(mainMod .. " + RIGHT", hl.dsp.movefocus("r"))
hl.bind(mainMod .. " + UP", hl.dsp.movefocus("u"))
hl.bind(mainMod .. " + DOWN", hl.dsp.movefocus("d"))

-- Workspaces (1-10)
for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.workspace(tostring(i)))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move_to_workspace(tostring(i)))
  hl.bind(mainMod .. " + SHIFT + ALT + " .. i, hl.dsp.window.move_to_workspace_silent(tostring(i)))
end
hl.bind(mainMod .. " + 0", hl.dsp.workspace("10"))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move_to_workspace("10"))
hl.bind(mainMod .. " + SHIFT + ALT + 0", hl.dsp.window.move_to_workspace_silent("10"))

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move_to_workspace_silent("special:scratchpad"))

-- Workspace Cycling
hl.bind(mainMod .. " + TAB", hl.dsp.workspace("e+1"))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.workspace("e-1"))
hl.bind(mainMod .. " + CTRL + TAB", hl.dsp.workspace("previous"))

-- Swap Windows
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.swap("l"))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.swap("r"))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.swap("u"))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.swap("d"))

-- Window Grouping
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + G", hl.dsp.group.move_out())
hl.bind(mainMod .. " + ALT + LEFT", hl.dsp.group.move_in("l"))
hl.bind(mainMod .. " + ALT + RIGHT", hl.dsp.group.move_in("r"))
hl.bind(mainMod .. " + ALT + UP", hl.dsp.group.move_in("u"))
hl.bind(mainMod .. " + ALT + DOWN", hl.dsp.group.move_in("d"))
hl.bind(mainMod .. " + ALT + TAB", hl.dsp.group.change_active("f"))
hl.bind(mainMod .. " + ALT + SHIFT + TAB", hl.dsp.group.change_active("b"))

-- Move/Resize with Mouse
hl.bind(mainMod .. " + mouse:272", "movewindow", { mouse = true })
hl.bind(mainMod .. " + mouse:273", "resizewindow", { mouse = true })

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
hl.bind(mainMod .. " + CTRL + ALT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- Lock System
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
