local mocha = require("catppuccin.palettes").get_palette("mocha")

require("bufferline").setup({
  options = {
    after = "catppuccin",
    config = function()
      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end,
    diagnostics = "nvim_lsp",
    left_mouse_command = nil,
    middle_mouse_command = "Bdelete! %d",
    close_command = "Bdelete! %d",
    indictator = {
      icon = "▎",
      style = "icon",
    },
    offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
    hover = { enabled = true, delay = 200, reveal = { "close" } },
    separator_style = "thin",
    highlights = require("catppuccin.groups.integrations.bufferline").get({
      styles = { "italic", "bold" },
      custom = {
        all = {
          fill = { bg = "#000000" },
        },
        mocha = {
          background = { fg = mocha.text },
        },
        latte = {
          background = { fg = "#000000" },
        },
      },
    }),
  },
})
