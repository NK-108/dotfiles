return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = false,
    },
  },
  {
    "dzfrias/noir.nvim",
    priority = 1000,
    config = function()
      local colors = require("noir.colors")
      colors.bg = "#202020"
    end,
  },
  {
    "kdheepak/monochrome.nvim",
    priority = 1000,
  },
  {
    "blazkowolf/gruber-darker.nvim",
    priority = 1000,
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
    lazy = false,
    priority = 1000,
  },
  {
    "ring0-rootkit/ring0-dark.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
  },
}
