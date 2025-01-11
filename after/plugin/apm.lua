local apm = require("vim-apm")

apm:setup({})
vim.keymap.set("n", "<leader>mapm", function()
  apm:toggle_monitor()
end)
