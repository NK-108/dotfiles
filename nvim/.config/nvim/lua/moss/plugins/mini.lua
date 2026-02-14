return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.align").setup({
      mappings = {
        start = "<leader>a",
        start_with_preview = "<leader>A",
      },
    })

    require("mini.move").setup({
      mappings = {
        left  = "<S-M-h>",
        right = "<S-M-l>",
        down  = "<S-M-j>",
        up    = "<S-M-k>",

        line_left  = "<S-M-h>",
        line_right = "<S-M-l>",
        line_down  = "<S-M-j>",
        line_up    = "<S-M-k>",
      },
    })

    require("mini.surround").setup({})

    require("mini.operators").setup({})

    require("mini.bracketed").setup({})
  end,
}
