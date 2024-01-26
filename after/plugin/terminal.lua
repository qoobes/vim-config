-- require("toggleterm").setup({

-- 	open_mapping = [[<c-\>]],
-- })

require("FTerm").setup({
  border = "double",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

vim.keymap.set("n", "<c-\\>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<c-\\>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
