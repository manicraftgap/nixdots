-- ~/.config/hypr/autostart.lua

-- Application execution hooks
hl.exec_cmd("uwsm-app -- elephant")
hl.exec_cmd("uwsm-app -- walker --gapplication-service")
hl.exec_cmd("uwsm-app -- waybar")

-- Core Environment Optimization
hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

-- Background System Processes
hl.exec_cmd("uwsm-app -- hypridle") -- Fixed!
hl.exec_cmd("uwsm-app -- mako")
hl.exec_cmd("uwsm-app -- fcitx5 --disable notificationitem")
hl.exec_cmd("uwsm-app -- swaybg -i ~/adam.jpeg -m fill")
hl.exec_cmd("uwsm-app -- hyprsunset")
