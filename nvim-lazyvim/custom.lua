return {
  {
    -- We can use a lightweight plugin or native config to handle mappings,
    -- or set up a custom local plugin structure for full control.
    "folke/noice.nvim", -- (Just an example wrapper, or you can write pure Lua specs)
    enabled = false,
  },

  -- Pure Lua keymap for 'jj' to Esc in insert and command-line mode
  {
    "AstroNvim/astrocore", -- Or just standard Lua config block:
    event = "VeryLazy",
    config = function()
      -- Map 'jj' to Esc in Insert mode
      vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj", silent = true })
    end,
  },
}