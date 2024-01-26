require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,        -- use a classic bottom cmdline for search
    command_palette = true,      -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false,          -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,      -- add a border to hover docs and signature help
  },
  views = {
    cmdline_popup = {
      border = {
        rounded = true,
        padding = { 0, 1 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
  },
})

vim.keymap.set("n", "<leader>nt", "<cmd>Noice telescope<cr>", {
  noremap = true,
  silent = true,
})
