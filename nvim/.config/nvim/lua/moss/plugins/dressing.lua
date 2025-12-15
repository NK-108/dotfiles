return {
  'stevearc/dressing.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    input = {
      border = "single",
      start_mode = "normal",
      mappings = {
        n = {
          ["Esc"] = "Close",
          ["q"] = "Close",
          ["<CR>"] = "Confirm",
        },
      },
    },
  },
}
