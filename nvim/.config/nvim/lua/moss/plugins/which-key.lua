return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 1000,
    triggers = {
      { "<leader>", mode = "nxso" },
    },
    icons = {
      mappings = vim.g.have_nerd_font,
    },
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>f', group = '[F]ile' },
      { '<leader>l', group = '[L]anguage' },
      { '<leader>q', group = '[Q]uickfix' },
      { '<leader>m', group = '[M]ake' },
      { '<leader>d', group = '[D]ebugger' },
    },
    win = {
      border = "single",
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
