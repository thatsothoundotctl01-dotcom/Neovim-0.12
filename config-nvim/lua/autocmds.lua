-- lua/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight text when yanking (copying)
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = highlight_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})