require("catppuccin").setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = true,
    },
    treesitter = true,
    notify = true,
    -- noice = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    telescope = {
      enabled = true,
      style = "nvchad",
    },
    which_key = true,
    indent_blankline = { enabled = true, colored_indent_levels = true },
    -- bufferline = true,
    markdown = true,
    ts_rainbow = true,
    hop = false,
  },
  term_colors = false,
  transparent_background = true,
})
