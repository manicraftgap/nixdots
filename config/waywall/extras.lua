local waywall = require("waywall")
local helpers = require("waywall.helpers")

return function(config)
  -- Add any extra code here

  -- Track whether the overlay is currently visible and store its instance
  local oneshot_visible = false
  local oneshot_instance = nil

  -- Define the path to your oneshot resource
  local waywall_config_path = os.getenv("HOME") .. "/.config/waywall/"
  local oneshot_overlay_path = waywall_config_path .. "resources/oneshot.png"

  -- Inject the toggle function into the action table tied to your config key
  -- This relies on `enable_oneshot_overlay_key = "H"` defined in your config
  config.actions["H"] = function()
    if oneshot_visible and oneshot_instance then
      -- If it's already on screen, close/remove it
      oneshot_instance:close()
      oneshot_instance = nil
      oneshot_visible = false
      print("Oneshot overlay hidden")
    else
      -- If it's hidden, display the image
      -- Adjust the dst coordinates (x, y, w, h) and depth to suit your resolution
      oneshot_instance = waywall.image(oneshot_overlay_path, {
        dst = { x = 0, y = 0, w = config.window.fullscreen_width, h = config.window.fullscreen_height },
        depth = 4, -- Set high depth to stay above other mirrors/backgrounds
      })
      oneshot_visible = true
      print("Oneshot overlay shown")
    end
  end
  -- END
end
