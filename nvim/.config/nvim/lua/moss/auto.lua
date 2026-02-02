local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Disables Treesitter Syntax Highlights on by Default (toggleable with <leader>ts)
-- autocmd({ "BufReadPost", "BufNewFile" }, {
--   callback = function(args)
--     pcall(vim.treesitter.stop, args.buf)
--   end,
-- })

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.h",
  callback = function(args)
    vim.bo.filetype = "c"
  end,
  desc = "Treat '.h' files as C files",
})

-- autocmd("FileType", {
--   pattern = {"c", "cpp", "h", "hpp"},
--   callback = function()
--     local file = vim.fn.expand("%")
--     local basename = vim.fn.expand("%:r")
--     local dir = vim.fn.expand("%:p:h")
--
--     local filetype = vim.bo.filetype
--     local compiler = (filetype == "c") and "gcc" or "g++"
--
--     local headers = vim.fn.glob(dir .. "/*.[h,hpp]", false, true)
--     local header_list = table.concat(headers, " ")
--
--     vim.opt_local.makeprg = string.format(
--       "%s -Wall -Wextra -pedantic -g %s -o %s %s",
--       compiler, file, basename, header_list
--     )
--   end,
--   group = augroup("MakeProgram", { clear = true }),
--   desc = "Set C File Compiler to GCC and include all headers in directory",
-- })

-- autocmd("FileType", {
--   pattern = {"cpp", "hpp"},
--   callback = function()
--     vim.opt_local.makeprg = "make -C build"
--   end,
--   group = augroup("MakeProgram", { clear = true }),
--   desc = "Set makeprg to support CMake if CMakeLists.txt is present"
-- })

-- Disbale automatic comment on new line
autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove {"c", "r", "o"}
  end,
  group = augroup("AutoCommentDisable", { clear = true }),
  desc = "Disable New Line Comment",
})

-- Highlight text briefly after yanking
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight Yanked Text",
})
