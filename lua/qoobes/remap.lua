local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy pasting remaps
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("x", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>Y", '"+Y', opts)

vim.keymap.set("n", "<leader>d", '"_d', opts)
vim.keymap.set("v", "<leader>d", '"_d', opts)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- WIndow navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window resizing
keymap("n", "<CS-Up>", ":resize -2<CR>", opts)
keymap("n", "<CS-Down>", ":resize +2<CR>", opts)
keymap("n", "<CS-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<CS-Right>", ":vertical resize -2<CR>", opts)

-- buffers
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bc", ":Bdelete<CR>", opts)

--- Mpa ctrl c to esc
keymap("i", "<C-c>", "<Esc>", opts)

keymap("n", "<leader>lsp", ":LspRestart<CR>", opts)

keymap("n", "<leader>gps", ":G! push ", {
  noremap = true,
})

-- -- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
