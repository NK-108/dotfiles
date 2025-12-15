require("type.set")
require("type.remap")
require("type.lazy_init")

vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup('general', {})
autocmd("FileType", {
  pattern = {"c", "cpp", "h", "hpp"},
  callback = function()
    local file = vim.fn.expand("%")
    local basename = vim.fn.expand("%:r")
    local dir = vim.fn.expand("%:p:h")

    local filetype = vim.bo.filetype
    local compiler = (filetype == "c") and "gcc" or "g++"

    local headers = vim.fn.glob(dir .. "/*.[h,hpp]", false, true)
    local header_list = table.concat(headers, " ")

    vim.opt_local.makeprg = string.format(
      "%s -Wall -Wextra -pedantic -g %s -o %s %s",
      compiler, file, basename, header_list
    )
  end,
  group = general,
  desc = "Set C File Compiler to GCC and include all headers in directory",
})

autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove {"c", "r", "o"}
  end,
  group = general,
  desc = "Disable New Line Comment",
})

