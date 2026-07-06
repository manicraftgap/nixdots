-- Cursor settings[cite: 8]
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force applications to use Wayland[cite: 8]
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Screen sharing support[cite: 8]
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- XCompose[cite: 8]
hl.env("XCOMPOSEFILE", "~/.XCompose")

hl.config({
  xwayland = {
    force_zero_scaling = true     --[cite: 8]
  },
  ecosystem = {
    no_update_news = true     -- Don't show update on first launch[cite: 8]
  }
})
