-- lua/options.lua
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- System clipboard integration
opt.clipboard = "unnamedplus"

-- Undo and backup
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Times
opt.updatetime = 250
opt.timeoutlen = 300