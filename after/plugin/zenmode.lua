local zmode = require("zen-mode")

function _G.zenmode_toggle()
  zmode.toggle({
    window = {
      width = 0.85,
    },
  })
end

vim.keymap.set("n", "<leader>z", "<cmd>lua zenmode_toggle()<cr>", {
  noremap = true,
  silent = true,
})
