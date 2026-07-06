-- ~/.config/hypr/monitors.lua

hl.monitor({
  output = "all",   -- Explicitly matches any/all connected monitors
  mode = "preferred",
  position = "auto",
  scale = "auto"
})

-- Environment Variables
hl.env("GDK_SCALE", "2")
