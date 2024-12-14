local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true }) -- NOTE: Switch to sync if it becomes an issue
      end)
      vim.keymap.set("v", "<leader>f", function()
        vim.lsp.buf.format({
          async = true,
          range = {
            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
          },
        })
      end, { buffer = bufnr })
    end
  end,
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/prettier/.prettierrc"),
      },
    }),
    null_ls.builtins.formatting.stylua,
    require("none-ls.diagnostics.eslint_d").with({
      diagnostics_format = "[eslint] #{m}",
    }),
    require("none-ls.code_actions.eslint_d"),
    null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.formatting.prismaFmt,
    null_ls.builtins.formatting.remark,
    -- go formatting
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    -- require("none-ls.diagnostics.shellcheck"),
    -- require("none-ls.code_actions.shellcheck"),
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
  },
})
