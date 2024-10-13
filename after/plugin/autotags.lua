require("nvim-ts-autotag").setup({
  enable = true,
  enable_rename = true,
  enable_close = true,
  enable_close_on_slash = true,
  filetypes = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx" },
  update_in_insert = true,
})
