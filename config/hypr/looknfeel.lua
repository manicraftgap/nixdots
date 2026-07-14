-- ~ / .config/hypr/looknfeel.lua

hl.config({
  general = {
    -- Kept clean; add custom gaps/borders here if needed
  },
  decoration = {
    rounding = 0
  },
  animations = {
    enabled = true,
    animation = {
      { "windows",          0, 1, "default" },
      { "windowsMove",      1, 1, "default" },
      { "workspaces",       0, 1, "default" },
      { "specialWorkspace", 0, 1, "default" },
      { "layers",           0, 1, "default" },
      { "fade",             1, 1, "default" },
      { "border",           1, 1, "default" },
      { "borderangle",      1, 1, "default" }
    }
  },
  windowrulev2 = {
    "noanim, workspace:name:special:scratchpad"
  }
})
