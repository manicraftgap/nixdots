-- ~ / .config/hypr/hyprland.lua
-- Native Hyprland Lua Configuration

-- Load personal configuration modules
require("monitors")
require("input")
require("bindings")
require("looknfeel")
require("autostart")

-- Smart gaps config (Replaces workspace = w[tv1] / f[1] rules)
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

-- XWayland legacy support
hl.config({
  xwayland = {
    enable = true
  }
})
