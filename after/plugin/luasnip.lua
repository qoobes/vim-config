require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "~/.config/nvim/snippets" },
})

print(vim.fn.stdpath("log"))
