return {
  {
    "rrethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = {
        base00 = "#000000", -- Background
        base01 = "#171717", -- Statuslines / Panels
        base02 = "#591212", -- Selection Background (Muted Red)
        base03 = "#4a4a4a", -- Comments / Inactive Text (Dark Grey)
        base04 = "#b90606", -- Accent / Line Numbers
        base05 = "#eaeaea", -- Default Text / Properties (Off-white)
        base06 = "#ffffff", -- Variables / Function arguments (Pure White)
        base07 = "#ffffff", -- Special keys
        base08 = "#ef4444", -- Keywords / Tags (Bright Red)
        base09 = "#ff0000", -- Numbers / Constants (Pure Red)
        base0A = "#ef4444", -- Functions / Classes
        base0B = "#ff0000", -- Strings (Pure Red)
        base0C = "#eaeaea", -- Operators
        base0D = "#ffffff", -- Methods / Identifiers (White)
        base0E = "#ef4444", -- Conditionals / Imports (Bright Red)
        base0F = "#dc2626", -- Warnings / Errors
      }

      require("base16-colorscheme").setup(colors)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-colorscheme",
    },
  },
}
