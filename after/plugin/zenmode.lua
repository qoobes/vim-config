local zmode = require("zen-mode")

function _G.zenmode_toggle()
  zmode.toggle({
    window = {
      width = 0.99,
    },
  })
end

vim.keymap.set("n", "<leader>mz", "<cmd>lua zenmode_toggle()<cr>", {
  noremap = true,
  silent = true,
})
