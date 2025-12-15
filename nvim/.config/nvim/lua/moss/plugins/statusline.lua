local lualine_pos = function()
  local row, col = vim.fn.line("."), vim.fn.col(".")
  local total_rows = vim.fn.line("$")
  local total_cols = vim.fn.strdisplaywidth(vim.fn.getline("."))
  local pos = string.format("%d|%d %d|%d", row, total_rows, col, total_cols)
  local POS_WIDTH = 0
  return string.format("%" .. POS_WIDTH .. "s", pos)
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox',
      },
      sections = {
        lualine_c = {'buffers'},
        lualine_x = {'filetype', 'encoding'},
        lualine_y = {'lsp_status'},
        lualine_z = {lualine_pos},
      },
    })
  end,
}
