require("lualine").setup({
  options = {
    theme = "catppuccin",
    -- ... the rest of your lualine config
  },
  sections = {
    lualine_x = {
      "copilot",
    },
  },
})
