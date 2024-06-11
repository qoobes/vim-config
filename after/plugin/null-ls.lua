--- WARNING: null-ls has been deprecated / archived, but I use it until it breaks

local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false }) -- NOTE: Switch to sync if it becomes an issue
        end,
      })
    end
  end,

  sources = {
    null_ls.builtins.formatting.prettierd.with({
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/prettier/.prettierrc"),
      },
    }),
    null_ls.builtins.formatting.stylua,
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.prismaFmt,
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
