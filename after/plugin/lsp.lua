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

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, getOpts("Go to definition"))

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
	-- vim.keymap.set("n", "bgr", function() vim.diagnostic.goto_prev() end, opts) -- Disabled cause it interferes with vim
	--
	vim.keymap.set("n", "ga", function()
		vim.lsp.buf.code_action()
	end, getOpts("View code actions"))

	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references({ includeDeclaration = false })
	end, getOpts("View references"))

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

vim.keymap.set("i", "<C-Space>", function()
	vim.lsp.buf.completion()
end, { buffer = 0, remap = false })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require("lspkind")
local has_words_before = function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or "")
		:sub(cursor[2], cursor[2])
		:match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- can also be a function to dynamically calculate max width such as
			-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		}),
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
	},

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			elseif cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			-- elseif require("luasnip").expandable() then
			-- 	require("luasnip").expand()
			-- elseif has_words_before() then
			-- 	cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
})
