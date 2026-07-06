-- ~/.config/hypr/autostart.lua

hl.on("hyprland.start", function()
  -- Application execution hooks
  hl.dsp.exec_cmd("uwsm-app -- elephant")
  hl.dsp.exec_cmd("uwsm-app -- walker --gapplication-service")
  hl.dsp.exec_cmd("uwsm-app -- waybar")

  -- Core Environment Optimization
  hl.dsp.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.dsp.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.dsp.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

  -- Background System Processes
  hl.dsp.exec_cmd("uwsm-app -- hypridle")
  hl.dsp.exec_cmd("uwsm-app -- mako")
  hl.dsp.exec_cmd("uwsm-app -- fcitx5 --disable notificationitem")
  hl.dsp.exec_cmd("uwsm-app -- swaybg -i ~/adam.jpeg -m fill")
  hl.dsp.exec_cmd("uwsm app -- hyprsunset")
end)
