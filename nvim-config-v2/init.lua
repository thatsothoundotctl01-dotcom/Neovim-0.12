-- ~/.config/nvim/init.lua
-- Neovim setup: nightfox/carbonfox colorscheme, nvim-tree, bufferline,
-- lualine, treesitter, LSP (rust-analyzer example), gitsigns, navic.

--------------------------------------------------------------------------
-- 1. Basic options
--------------------------------------------------------------------------
vim.g.mapleader = " "
local o = vim.opt
o.number = true
o.relativenumber = true
o.termguicolors = true       -- required for colorschemes to render correctly
o.signcolumn = "yes"
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = false
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8
o.updatetime = 250
o.mouse = "a"

--------------------------------------------------------------------------
-- 2. Bootstrap lazy.nvim (plugin manager)
--------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------
-- 3. Plugins
--------------------------------------------------------------------------
require("lazy").setup({

  -- Colorscheme (nightfox / carbonfox variant)
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = { transparent = false, dim_inactive = true },
      })
      vim.cmd("colorscheme carbonfox")
    end,
  },

  -- Icons (dependency for tree/bufferline/lualine)
  { "nvim-tree/nvim-web-devicons" },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 32 },
        renderer = { group_empty = true },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },

  -- Buffer/tab line (top bar)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = { diagnostics = "nvim_lsp", separator_style = "slant" },
      })
    end,
  },

  -- Git signs in the gutter, feeds branch name to lualine
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Statusline (bottom bar)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "carbonfox", globalstatus = true },
        sections = {
          lualine_c = {
            "filename",
            { "navic", color_correction = "static" },
          },
        },
      })
    end,
  },

  -- Treesitter: real syntax-aware highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "rust", "lua", "toml", "markdown", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP config + Rust tooling
  { "neovim/nvim-lspconfig" },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
  },

  -- Function/context breadcrumb (the "(f compress_man)" in your statusline)
  { "SmiteshP/nvim-navic" },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

}, { install = { colorscheme = { "carbonfox" } } })

--------------------------------------------------------------------------
-- 4. Hook navic into LSP so the breadcrumb populates
--------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, args.buf)
    end
  end,
})