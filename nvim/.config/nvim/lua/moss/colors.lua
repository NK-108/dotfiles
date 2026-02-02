vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- vim.api.nvim_set_hl(0, "@type", { link = "GruvboxOrange" })
    -- vim.api.nvim_set_hl(0, "@type.builtin", { link = "GruvboxOrange" })
    -- vim.api.nvim_set_hl(0, "@keyword.type", { link = "GruvboxOrange" })
    vim.api.nvim_set_hl(0, "@function.c", { link = "GruvboxForeground" })
  end,
  pattern = "gruvbox*",
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd.highlight('Normal guibg=#202020')
    vim.cmd.highlight('NormalFloat guibg=#202020')
    vim.cmd.highlight('Comment guifg=#505050')
  end,
  group = vim.api.nvim_create_augroup('Colorschemes', { clear = true }),
  pattern = "noir*",
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd.highlight('Normal guibg=#282828')
    vim.cmd.highlight('NormalFloat guibg=#282828')
  end,
  group = vim.api.nvim_create_augroup('Colorschemes', { clear = true }),
  pattern = "gruber-darker*",
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruber-darker]])
