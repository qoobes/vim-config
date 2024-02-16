require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  size = 20,
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  auto_scroll = true,    -- automatically scroll to the bottom on terminal output
})

-- require("FTerm").setup({
--   border = "double",
--   dimensions = {
--     height = 0.9,
--     width = 0.9,
--   },
-- })
--
-- vim.keymap.set("n", "<c-\\>", '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set("t", "<c-\\>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
