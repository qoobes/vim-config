-- Utilities for creating configurations
local util = require("formatter.util")

local function prettierd(parser)
	if not parser then
		return {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				util.escape_path(util.get_current_buffer_file_path()),
			},
			stdin = true,
			try_node_modules = true,
		}
	end

	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			util.escape_path(util.get_current_buffer_file_path()),
			"--parser",
			parser,
		},
		stdin = true,
		try_node_modules = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		javascript = { prettierd },
		typescript = { prettierd },
		javascriptreact = { prettierd },
		typescriptreact = { prettierd },
		vue = { prettierd },
		["javascript.jsx"] = { prettierd },
		["typescript.tsx"] = { prettierd },
		markdown = { prettierd },
		css = { prettierd },
		json = { prettierd },
		jsonc = { prettierd },
		scss = { prettierd },
		less = { prettierd },
		yaml = { prettierd },
		graphql = { prettierd },
		html = { prettierd },

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

local lspconfig = require("lspconfig")

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
