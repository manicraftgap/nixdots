-- ~ / .config/hypr/monitors.lua

-- Optimized for retina-class 2x displays
hl.monitor({
  name = "",   -- Empty string implies fallback/all monitors (e.g., monitor=,preferred,auto,auto)
  resolution = "preferred",
  position = "auto",
  scale = "auto"
})

-- Environment Variables
hl.env("GDK_SCALE", "2")
