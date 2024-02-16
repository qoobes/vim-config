vim.diagnostic.config({ virtual_text = false }) -- False by default
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end, {})

vim.keymap.set("n", "<leader>dt", ":DiagnosticsToggleVirtualText<CR>", { silent = true, noremap = true })
