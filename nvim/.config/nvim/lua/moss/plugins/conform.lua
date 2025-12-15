return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_format = "fallback",
          timemout_ms = 5000,
        })
      end,
      desc = "[C]ode [F]ormat",
    },
  },
}
