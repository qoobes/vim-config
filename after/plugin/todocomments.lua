require("todo-comments").setup({})

vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", {
  silent = true,
  noremap = true,
})
