return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
    config = function()
        require('neo-tree').setup({})
        vim.keymap.set('n', '<C-n>', '<cmd>Neotree filesystem toggle reveal float<cr>', {})
    end
}
