vim.g.mapleader = " "
vim.g.rootmapleader = "\\"

local map = vim.keymap.set

map({ "n" }, "<leader>w", "<Cmd>:update<CR>", { desc = "Write the current buffer."})
map({ "n" }, "<leader>q", "<Cmd>:quit<CR>", { desc = "Quit the current buffer."})
map({ "n" }, "<leader>Q", "<Cmd>:wqa<CR>", { desc = "Write and quit all buffers."})
map({ "n", "x", "v" }, "<leader>o", "<Cmd>:source %<CR>", { desc = "Source current file."})
-- map({ "n" }, "<leader>O", "<Cmd>:restart<CR>", { desc = "Restart neovim."})

map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')
map({ "n", "t" }, "<leader>t", "<Cmd>tabnew<CR>")
map({ "n", "t" }, "<leader>x", "<Cmd>tabclose<CR>")

local function toggle_qf()
  local qf_exists = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "quickfix" then
      qf_exists = true
      break
    end
  end

  if qf_exists then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

map({ "n" }, "<C-c>", "<Cmd>make<CR>")
map("n", "<C-e>", toggle_qf, { desc = "Toggle quickfix window" })

for i = 1, 8 do
	map({ "n", "t" }, "<Leader>" .. i, "<Cmd>tabnext " .. i .. "<CR>")
end

