-- function _G.get_oil_winbar()
--   local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
--   local dir = require("oil").get_current_dir(bufnr)
--   if dir then
--     return vim.fn.fnamemodify(dir, ":~")
--   else
--     return vim.api.nvim_buf_get_name(0)
--   end
-- end

return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  keys = {
    {
      "-",
      "<Cmd>Oil --float <CR>",
      desc = "Open Parent Directory in Oil",
    },
  },
  config = function()
    local detail = false
    require("oil").setup({
      -- win_options = {
      --   winbar = "%!v:lua.get_oil_winbar()",
      -- },
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mttime",
      },
      keymaps = {
        ["gp"] = {
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
          mode = "n",
          desc = "Toggle Detailed Columns",
        },
        ["q"] = {
          "<Cmd>quit<CR>",
          mode = "n",
          desc = "Quit Oil Buffer",
        },
      },
      float = {
        border = "single",
      },
      confirmation = {
        border = "single",
      },
      progress = {
        border = "single",
      },
      ssh = {
        border = "single",
      },
      keymaps_help = {
        border = "single",
      },
    })
  end,
  -- Optional dependencies
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  -- also works with nvim-mini/mini.icons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
