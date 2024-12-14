require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Notes",
    },
  },
})

-- keybindings

vim.keymap.set("n", "<leader>op", ":ObsidianQuickSwitch<CR>", {
  desc = "Open Obsidian Quick Switch",
})
vim.keymap.set("n", "<leader>opg", ":ObsidianSearch<CR>", {
  desc = "Open Obsidian Search",
})
vim.keymap.set("n", "<leader>ow", ":ObsidianWorkspace<CR>", {
  desc = "Open Obsidian Workspace",
})
vim.keymap.set("n", "<leader>oc", ":ObsidianNew<CR>", {
  desc = "New Obsidian Note",
})
vim.keymap.set("n", "<leader>on", ":ObsidianToggleCheckbox<CR>", {
  desc = "Flip Obsidian Checklist",
})
