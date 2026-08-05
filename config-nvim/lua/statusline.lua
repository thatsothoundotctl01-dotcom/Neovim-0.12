-- lua/statusline.lua
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
                icons_enabled = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "|", right = "|" },
            },
        })
    end,
}