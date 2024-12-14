require("nvim-ts-autotag").setup({
  opts = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    update_on_insert = true,
  },
  filetypes = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx" },
})
