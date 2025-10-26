function Color()
    vim.cmd.colorscheme("tokyonight-storm")
end

return {


    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = false,
                styles = {},
            })
            Color();
        end
    },
    {
        'everviolet/nvim', name = 'evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
            theme = {
                variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
                accent = 'green',
            },
        },
    },
    {
        "glepnir/zephyr-nvim",
        name = "zephyr",
    },
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
    },
    {
        "shaunsingh/nord.nvim",
        name = "nord",
    },
}
