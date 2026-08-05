-- lua/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live Grep" },
        { "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers" },
    },
}