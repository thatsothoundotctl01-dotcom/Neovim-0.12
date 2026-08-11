
  -- 4. Mason: only auto-install tools you need (fewer = faster startup)
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- trim this list to only what you actually use
        "stylua",
      },
    },
  },

  -- 5. Disable animations / extra UI chrome that can feel sluggish
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },

  -- 6. Faster statusline: fewer sections = less per-render work
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true, -- one statusline instead of per-window
        icons_enabled = true,
      },
    },
  },

  -- 7. Trim indent/scope guides overhead on large files
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = { enabled = true },
    },
  },

  -- 8. Disable unused LazyVim extras you don't need loaded
  -- (comment/uncomment via `:LazyExtras` instead of hardcoding here)
