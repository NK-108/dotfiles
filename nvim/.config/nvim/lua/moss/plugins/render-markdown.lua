return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = false,
    completions = { lsp = { enabled = true }, },
  },
  keys = {
    {
      "<leader>tm",
      "<Cmd>RenderMarkdown toggle<CR>",
      desc = "[T]oggle [M]arkdown Rendering",
    },
  },
}
