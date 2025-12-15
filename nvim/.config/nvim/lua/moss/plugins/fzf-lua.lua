return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  opts = {
    winopts = {
      border = "single",
      preview = {
        border = "single",
      }
    }
  },
  keys = {
    {
      "<leader>ss",
      function() require("fzf-lua").builtin() end,
      desc = "Find Fuzzy Finder",
    },
    {
      "<leader>sf",
      function() require("fzf-lua").files() end,
      desc = "Find Files in Current Directory",
    },
    {
      "<leader>sn",
      function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") .. "/lua/moss/" }) end,
      desc = "Find Files in Project Root Directory",
    },
    {
      "<leader>sg",
      function() require("fzf-lua").live_grep() end,
      desc = "Live Grep in Project Directory",
    },
    {
      "<leader>sq",
      function() require("fzf-lua").quickfix() end,
      desc = "Find Quickfix",
    },
    {
      "<leader>sb",
      function() require("fzf-lua").buffers() end,
      desc = "Find Open Buffers",
    },
    {
      "<leader>st",
      function() require("fzf-lua").tabs() end,
      desc = "Find Open Tabs",
    },
    {
      "<leader>sh",
      function() require("fzf-lua").helptags() end,
      desc = "Find Help Tags",
    },
    {
      "<leader>sk",
      function() require("fzf-lua").keymaps() end,
      desc = "Find Keymaps",
    },
    {
      "<leader>sm",
      function() require("fzf-lua").manpages() end,
      desc = "Find Man Pages",
    },
    {
     "<leader>sw",
      function() require("fzf-lua").grep_cword() end,
      desc = "Find Current [w]ord",
    },
    {
      "<leader>sW",
      function() require("fzf-lua").grep_cWORD() end,
      desc = "Find Current [W]ORD",
    },
    {
      "<leader>sr",
      function() require("fzf-lua").resume() end,
      desc = "Find Resume",
    },
    {
      "<leader>so",
      function() require("fzf-lua").oldfiles() end,
      desc = "Find Old Files",
    },
    {
      "<leader>s/",
      function() require("fzf-lua").lgrep_curbuf() end,
      desc = "Live Grep the Current Buffer",
    },
    {
      "<leader>sd",
      function() require("fzf-lua").diagnostics_document() end,
      desc = "Find LSP Diagnostics",
    },
  },
  ---@diagnostics enable: missing-fields
}
