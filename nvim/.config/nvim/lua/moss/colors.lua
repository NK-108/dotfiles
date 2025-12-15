vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- vim.api.nvim_set_hl(0, "@type", { link = "GruvboxOrange" })
    -- vim.api.nvim_set_hl(0, "@type.builtin", { link = "GruvboxOrange" })
    -- vim.api.nvim_set_hl(0, "@keyword.type", { link = "GruvboxOrange" })
    vim.api.nvim_set_hl(0, "@function.c", { link = "GruvboxForeground" })
  end,
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- local neutral = { link = "Normal" }
--
-- vim.api.nvim_set_hl(0, "@variable", neutral)
-- vim.api.nvim_set_hl(0, "@variable.builtin", neutral)
-- vim.api.nvim_set_hl(0, "@parameter", neutral)
-- vim.api.nvim_set_hl(0, "@field", neutral)
-- vim.api.nvim_set_hl(0, "@property", neutral)
-- vim.api.nvim_set_hl(0, "@namespace", neutral)
-- vim.api.nvim_set_hl(0, "@type.builtin", neutral)
-- vim.api.nvim_set_hl(0, "@constant.builtin", neutral)

