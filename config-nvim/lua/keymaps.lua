-- lua/keymaps.lua
local map = vim.keymap.set

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", { silent = true })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Stay in indent mode when indenting code
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })