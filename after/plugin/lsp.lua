local lsp_zero = require("lsp-zero")

---@diagnostic disable-next-line: unused-local
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  local function getOpts(text)
    return {
      buffer = bufnr,
      remap = false,
      desc = text,
      noremap = true,
    }
  end

  vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>", getOpts("Go to definition"))

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, getOpts("Hover to see available options."))

  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, getOpts("Search workspace symbols"))

  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, getOpts("Open diagnostics"))

  vim.keymap.set("n", "gr", function()
    vim.diagnostic.goto_next()
  end, getOpts("Go to next diagnostic"))
  vim.keymap.set("n", "<leader>bgr", function()
    vim.diagnostic.goto_prev()
  end, opts) -- Disabled cause it interferes with vim
  vim.keymap.set("n", "ga", function()
    vim.lsp.buf.code_action()
  end, getOpts("View code actions"))

  vim.keymap.set("n", "<leader>gr", "<CMD>Glance references<CR>", getOpts("View references"))

  vim.keymap.set("n", "ge", function()
    vim.lsp.buf.rename()
  end, getOpts("Rename symbol"))
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "rust_analyzer" },
  handlers = {
    function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup({})
    end,
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})
