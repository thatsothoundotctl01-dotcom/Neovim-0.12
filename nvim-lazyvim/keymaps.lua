local Terminal = require("toggleterm.terminal").Terminal

local cpp_runner = Terminal:new({
  direction = "horizontal",
  close_on_exit = false,
  hidden = true,
})

vim.keymap.set("n", "<F6>", function()
  vim.cmd("w") -- save current file

  local filepath = vim.fn.expand("%:p")
  local outpath = vim.fn.expand("%:p:r")

  local cmd = string.format('g++ "%s" -o "%s" -std=c++17 && "%s"', filepath, outpath, outpath)

  cpp_runner.cmd = cmd
  cpp_runner:toggle()
end, { desc = "Compile and Run C++ (VS Code style)" })