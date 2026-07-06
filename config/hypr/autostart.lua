-- ~ / .config/hypr/autostart.lua

hl.on("hyprland.start", function()
    -- Walker Service
    hl.dsp.exec_cmd("elephant")
    hl.dsp.exec_cmd("walker --gapplication-service")
    -- Extra autostart processes
    hl.dsp.exec_cmd("uwsm app -- hyprsunset")
    -- Slow app launch fix: Systemd and DBUS environment variables[cite: 7]
    hl.dsp.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.dsp.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    -- Authentication agent[cite: 7]
    hl.dsp.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    -- Core Daemons & Background[cite: 7]
    hl.dsp.exec_cmd("uwsm-app -- hypridle")
    hl.dsp.exec_cmd("uwsm-app -- mako")
    hl.dsp.exec_cmd("uwsm-app -- waybar")
    hl.dsp.exec_cmd("uwsm-app -- fcitx5 --disable notificationitem")
    hl.dsp.exec_cmd("uwsm-app -- swaybg -i ~/.config/omarchy/current/background -m fi
end)
