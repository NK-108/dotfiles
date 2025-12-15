return {
  {
    "akinsho/toggleterm.nvim", version = "*",
    opts = {},
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = 'tab'
      })
      -- vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm<CR>', {})
    end
  }
}
