local lualine_pos = function()
  local row, col = vim.fn.line("."), vim.fn.col(".")
  local total_rows = vim.fn.line("$")
  local total_cols = vim.fn.strdisplaywidth(vim.fn.getline("."))
  local pos = string.format("%d|%d %d|%d", row, total_rows, col, total_cols)
  local POS_WIDTH = 0
  return string.format("%" .. POS_WIDTH .. "s", pos)
end

local colors = require("noir.colors")
local custom_bg = "#8080A0"

return {
  "nvim-lualine/lualine.nvim",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tomorrow_night",
          -- normal = { c = { fg = colors.fg, bg = colors.bg } },
          -- inactive = { c = { fg = colors.fg, bg = colors.bg } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { 
          "mode",
          color = { bg = custom_bg },
        } },
        lualine_b = {},
        lualine_c = { {
          "buffers",
          buffers_color = { active = 'lualine_b_normal', inactive = 'lualine_c_inactive' },
        } },
        lualine_x = {},
        lualine_y = { 'diagnostics', 'lsp_status' },
        lualine_z = { {
          lualine_pos,
          color = { bg = custom_bg },
        } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    })
  end,
}
