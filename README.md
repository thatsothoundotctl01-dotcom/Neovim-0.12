# ⚡ Neovim 0.12 Modular Configuration

Welcome to my modular Neovim configuration built for **Neovim 0.12**! This setup is designed for maximum speed, readability, and a modern development workflow—especially tailored for web development and modern programming languages.

---

## 📂 Project Structure

```text
~/.config/nvim/
├── init.lua
└── lua/
    ├── options.lua
    ├── keymaps.lua
    ├── autocmds.lua
    ├── plugins.lua
    ├── lsp.lua
    ├── ui.lua
    ├── cmp.lua
    ├── treesitter.lua
    ├── telescope.lua
    ├── git.lua
    ├── statusline.lua
    ├── explorer.lua
    └── formatter.lua
```

---

## 🚀 Key Highlights

* **Modular Lua Architecture:** Clean separation of concerns into single-responsibility configuration files.
* **Modern Plugin Management:** Fast, lazy-loaded setup utilizing `lazy.nvim`.
* **Enhanced LSP & Autocompletion:** Powered by `nvim-lspconfig`, `mason.nvim`, and `nvim-cmp`.
* **Advanced Formatting & Syntax:** Integrated code formatting via `conform.nvim` and AST-based parsing via `nvim-treesitter`.

---

## 🛠️ System Requirements

* **Neovim:** `v0.12.0` or higher
* **Git**
* **A Nerd Font** (e.g., *JetBrainsMono Nerd Font*) installed in your terminal for icons.
* **Node.js / npm** (required for certain language servers and formatters like Prettier).

---

## 📦 Installation

Clone this repository directly into your local Neovim configuration folder:

```bash
# Clone the repository
git clone https://github.com/thatsothoudotctl01-dotcom/Neovim-0.12.git ~/.config/nvim

# Start Neovim
nvim
```

Upon launching for the first time, `lazy.nvim` will automatically bootstrap and install all configured plugins.