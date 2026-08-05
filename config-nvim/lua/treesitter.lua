-- lua/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "javascript", "typescript", "tsx", "html", "css", "json", "c" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}