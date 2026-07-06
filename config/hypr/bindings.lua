-- ~ / .config/hypr/bindings.lua
local terminal = "ghostty"
local mainMod  = "SUPER"

-- --- Application Bindings ---
-- Terminal & Tmux (Stripped omarchy-cmd-terminal-cwd; starts in your default home shell directory)
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + ALT + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec tmux new"))

-- Web Browser (Replaced omarchy-launch-browser with direct xdg-open/native browser call)
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("uwsm-app -- xdg-open 'https://'"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("uwsm-app -- xdg-open 'https://'"))
hl.bind(mainMod .. " + SHIFT + ALT + B", hl.dsp.exec_cmd("uwsm-app -- xdg-open --incognito 'https://'"))

-- File Manager (Nautilus)
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"))
hl.bind(mainMod .. " + ALT + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window ~"))

-- Multimedia / System TUI Launchers (Assuming flatpaks/native binaries for app IDs)
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("uwsm-app -- flatpak run com.github.neithern.g4music"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("uwsm-app -- xdg-terminal-exec lazydocker"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("uwsm-app -- signal-desktop"))

-- --- Screenshots ---
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g '$(slurp)' - | wl-copy"))

-- --- Web Applications ---
-- Lua literal strings [[ ]] allow you to pass complex strings and hashes directly without messy quote escaping
hl.bind(mainMod .. " + SHIFT + ALT + A", hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://chatgpt.com"]]))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://perplexity.ai"]]))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://youtube.com/"]]))
hl.bind(mainMod .. " + SHIFT + CTRL + G",
  hl.dsp.exec_cmd([[uwsm-app -- xdg-open "https://messages.google.com/web/conversations"]]))

-- --- Window Resizing ---
hl.bind(mainMod .. " + SHIFT + ALT + right", hl.dsp.window.resizeactive({ x = 30, y = 0 }))
hl.bind(mainMod .. " + SHIFT + ALT + left", hl.dsp.window.resizeactive({ x = -30, y = 0 }))
hl.bind(mainMod .. " + SHIFT + ALT + up", hl.dsp.window.resizeactive({ x = 0, y = -30 }))
hl.bind(mainMod .. " + SHIFT + ALT + down", hl.dsp.window.resizeactive({ x = 0, y = 30 }))

-- === Universal Clipboard (sendshortcut) ===[cite: 12]
hl.bind(mainMod .. " + C", hl.dsp.sendshortcut("CTRL", "Insert", "activewindow"))
hl.bind(mainMod .. " + V", hl.dsp.sendshortcut("SHIFT", "Insert", "activewindow"))
hl.bind(mainMod .. " + X", hl.dsp.sendshortcut("CTRL", "X", "activewindow"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("walker -m clipboard"))

-- === Media & Brightness (Native replacements for omarchy scripts) ===[cite: 13]
-- Volume (wpctl)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"))
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"))

-- Brightness (brightnessctl)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 100%"))
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1%"))
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +1%"))
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1%-"))

-- Media Playback (playerctl)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- === Window Management & Tiling ===[cite: 14]
hl.bind(mainMod .. " + W", hl.dsp.window.killactive())
hl.bind(mainMod .. " + J", hl.dsp.layout.togglesplit())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.togglefloating())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(0))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreenstate(0, 2))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen(1))

-- Focus[cite: 14]
hl.bind(mainMod .. " + LEFT", hl.dsp.window.movefocus("l"))
hl.bind(mainMod .. " + RIGHT", hl.dsp.window.movefocus("r"))
hl.bind(mainMod .. " + UP", hl.dsp.window.movefocus("u"))
hl.bind(mainMod .. " + DOWN", hl.dsp.window.movefocus("d"))

-- Workspaces (1-10)[cite: 14]
for i = 1, 9 do
  hl.bind(mainMod .. " + " .. i, hl.dsp.workspace(tostring(i)))
  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.movetoworkspace(tostring(i)))
  hl.bind(mainMod .. " + SHIFT + ALT + " .. i, hl.dsp.window.movetoworkspacesilent(tostring(i)))
end
-- Handle 0 for workspace 10[cite: 14]
hl.bind(mainMod .. " + 0", hl.dsp.workspace("10"))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.movetoworkspace("10"))
hl.bind(mainMod .. " + SHIFT + ALT + 0", hl.dsp.window.movetoworkspacesilent("10"))

-- Scratchpad[cite: 14]
hl.bind(mainMod .. " + S", hl.dsp.workspace.togglespecialworkspace("scratchpad"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.movetoworkspacesilent("special:scratchpad"))

-- Workspace Cycling[cite: 14]
hl.bind(mainMod .. " + TAB", hl.dsp.workspace("e+1"))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.workspace("e-1"))
hl.bind(mainMod .. " + CTRL + TAB", hl.dsp.workspace("previous"))

-- Swap Windows[cite: 14]
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.swapwindow("l"))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.swapwindow("r"))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.swapwindow("u"))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.swapwindow("d"))

-- Window Grouping[cite: 14]
hl.bind(mainMod .. " + G", hl.dsp.group.togglegroup())
hl.bind(mainMod .. " + ALT + G", hl.dsp.group.moveoutofgroup())
hl.bind(mainMod .. " + ALT + LEFT", hl.dsp.group.moveintogroup("l"))
hl.bind(mainMod .. " + ALT + RIGHT", hl.dsp.group.moveintogroup("r"))
hl.bind(mainMod .. " + ALT + UP", hl.dsp.group.moveintogroup("u"))
hl.bind(mainMod .. " + ALT + DOWN", hl.dsp.group.moveintogroup("d"))
hl.bind(mainMod .. " + ALT + TAB", hl.dsp.group.changegroupactive("f"))
hl.bind(mainMod .. " + ALT + SHIFT + TAB", hl.dsp.group.changegroupactive("b"))

-- Move/Resize with Mouse[cite: 14]
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.movewindow(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resizewindow(), { mouse = true })

-- === Utilities & Walkers ===[cite: 15]
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("walker"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("walker -m symbols"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("killall waybar || waybar"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))

-- Screenshots / Captures[cite: 15]
hl.bind("PRINT", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- Notifications (Mako)[cite: 15]
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"))
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("makoctl invoke"))
hl.bind(mainMod .. " + SHIFT + ALT + COMMA", hl.dsp.exec_cmd("makoctl restore"))

-- Zoom[cite: 15]
hl.bind(mainMod .. " + CTRL + Z",
  hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')"))
hl.bind(mainMod .. " + CTRL + ALT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- Lock System (Replaced Omarchy locker with standard hyprlock)[cite: 15]
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
