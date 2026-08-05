-- init.lua

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core settings
require("options")
require("keymaps")
require("autocmds")

-- Bootstrap and load plugins
require("plugins")