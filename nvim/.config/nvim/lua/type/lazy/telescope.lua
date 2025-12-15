return {
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      local function git_files() builtin.find_files({ no_ignore = true }) end

      local function grep() builtin.live_grep({ additional_args = { "-e" } }) end

      vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc = 'Telescope find files'})
      vim.keymap.set( "n" , "<leader>g", grep)
      vim.keymap.set({ "n" }, "<leader>sg", git_files)
      vim.keymap.set({ "n" }, "<leader>sb", builtin.buffers)
      vim.keymap.set({ "n" }, "<leader>si", builtin.grep_string)
      vim.keymap.set({ "n" }, "<leader>so", builtin.oldfiles)
      vim.keymap.set({ "n" }, "<leader>sh", builtin.help_tags)
      vim.keymap.set({ "n" }, "<leader>sm", builtin.man_pages)
      vim.keymap.set({ "n" }, "<leader>sr", builtin.lsp_references)
      vim.keymap.set({ "n" }, "<leader>sd", builtin.diagnostics)
      vim.keymap.set({ "n" }, "<leader>si", builtin.lsp_implementations)
      vim.keymap.set({ "n" }, "<leader>sT", builtin.lsp_type_definitions)
      vim.keymap.set({ "n" }, "<leader>ss", builtin.current_buffer_fuzzy_find)
      vim.keymap.set({ "n" }, "<leader>st", builtin.builtin)
      vim.keymap.set({ "n" }, "<leader>sc", builtin.git_bcommits)
      vim.keymap.set({ "n" }, "<leader>sk", builtin.keymaps)
      vim.keymap.set({ "n" }, "<leader>se", "<cmd>Telescope env<cr>")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
