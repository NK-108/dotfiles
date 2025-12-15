return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "vim",
          "vimdoc",
          "html",
          "markdown",
          "markdown_inline",
          "bash",
          "asm",
          "python",
        },
        sync_install = false,
        indent = { enable = true },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            scope_incremental = false, -- Set to 'false' to disable a mapping
            node_decremental = "<Backspace>",
          },
        },
      })
    end,
    keys = {
      {
        "<leader>lI",
        "<Cmd>Inspect<CR>",
        mode = { 'n', 'v' },
        desc = "[L]anguage Syntax [I]nspection",
      },
      {
        "<leader>ts",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local active = vim.treesitter.highlighter.active[bufnr]

          if active then
            vim.treesitter.stop(bufnr)
            vim.print("Disabled Syntax Highlighting")
          else
            vim.treesitter.start(bufnr)
            vim.print("Enabled Syntax Highlighting")
          end
        end,
        desc = "[T]oggle [S]yntax (Treesitter)",
      },
    },
  },
}
