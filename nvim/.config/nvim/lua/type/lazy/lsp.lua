return {
 {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        }
      })

      vim.diagnostic.enable = true
      vim.diagnostic.config({
        virtual_text = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls')
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
