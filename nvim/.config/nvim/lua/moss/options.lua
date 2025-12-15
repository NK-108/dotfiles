vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guicursor = ""

vim.g.have_nerd_font = true

-- Enables line numbers and relative numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Sets tab characteristics
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Configures default vim indenting behavior
vim.opt.smarttab = false
vim.opt.smartindent = false
vim.opt.autoindent = false
vim.opt.cindent = false

-- Disables line wrapping
vim.opt.wrap = false

-- Configures how vim stores edit history and whether it creates a swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Configures vim searching to assume case insensitivty unless you explicitly type a capital character
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10 -- Minimum numbers of characters to keep above/below cursor
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.showmode = false

vim.opt.updatetime = 50

-- Confiugre how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configures how certain special characters are displayed in washed out color
vim.opt.list = true
vim.opt.listchars = { tab = ">>", trail = ".", nbsp = "_" }

-- Configures the height of the command window below statusline
-- vim.opt.cmdheight = 0

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, 'FidgetTitle', { link = "NormalFloat" })
vim.api.nvim_set_hl(0, 'FidgetTask', { link = "NormalFloat"  })

-- Override open_floating_preview function so all calls to it have a border
do
  local orig = vim.lsp.util.open_floating_preview

  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}

    -- Global defaults
    opts.border = opts.border or "single"
    opts.focusable = true

    return orig(contents, syntax, opts, ...)
  end
end

