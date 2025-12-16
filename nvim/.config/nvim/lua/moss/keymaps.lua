local map = vim.keymap.set

-- General Mappings
map("n", "<leader>fw", "<Cmd>update<CR>", { desc = "Write current file if modified" })
map("n", "<leader>fs", "<Cmd>source %<CR>", { desc = "Source current file" })
map("n", "<leader>fq", "<Cmd>quit<CR>", { desc = "Quit current windows" })
map("n", "<leader>fQ", "<Cmd>wqa!<CR>", { desc = "Write and quit all open windows" })
map("n", "<leader>fc", '<Cmd>bdelete<CR>', { desc = "Delete current buffer" })

map({ "n", "v" }, "<leader>fy", '"+y', { desc = "Yank selection into system register" })
map({ "n", "v" }, "<leader>fd", '"+d', { desc = "Delete selection into system register" })
map({ "n", "v" }, "<leader>fp", '"+p', { desc = "Paste selection from system register after" })
map({ "n", "v" }, "<leader>fP", '"+P', { desc = "Paste selection from system register before" })

map("n", "<M-h>", '<Cmd>bprev<CR>', { desc = "Open previous buffer" })
map("n", "<M-l>", '<Cmd>bnext<CR>', { desc = "Open next buffer" })
map("n", "<M-j>", '<Cmd>tabprev<CR>', { desc = "Open next tab" })
map("n", "<M-k>", '<Cmd>tabnext<CR>', { desc = "Open previous tab" })

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Textobject Mappings
local swap = require("nvim-treesitter.textobjects.swap")

local swap_next = function()
  local count = vim.v.count1
  for _ = 1, count do
    swap.swap_next("@parameter.inner")
  end
end

local swap_prev = function()
  local count = vim.v.count1
  for _ = 1, count do
    swap.swap_previous("@parameter.inner")
  end
end

map("n", "<leader>cs", swap_next, { desc = "Swap inner parameter forward with count prefix" })
map("n", "<leader>cS", swap_prev, { desc = "Swap inner parameter forward with count prefix" })

-- -- Quickfix Mappings
-- local function toggle_qf()
--   local qf_exists = false
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     if vim.bo[buf].buftype == "quickfix" then
--       qf_exists = true
--       break
--     end
--   end
--
--   if qf_exists then
--     vim.cmd("cclose")
--   else
--     vim.cmd("copen")
--   end
-- end
