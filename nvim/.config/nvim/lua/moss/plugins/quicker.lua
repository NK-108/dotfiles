return {
  'stevearc/quicker.nvim',
  ft = "qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {},
  keys = {
    { "<leader>qq", function() require('quicker').toggle() end, desc = "Toggle quickfix" },
    { "<leader>qQ", function() require('quicker').toggle({ loclist = true }) end, desc = "Toggle loclist" },
    { "<leader>ql", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
    { "<leader>qh", "<cmd>lua require('quicker').collapse()<CR>", desc = "Collapse quickfix content" },
    { "<leader>qj", "<cmd>cnext<CR>", desc = "Move to next quckfix error" },
    { "<leader>qk", "<cmd>cprev<CR>", desc = "Move to previous quickfix error" },
  },
  trim_leading_whitespace = "all",
}
