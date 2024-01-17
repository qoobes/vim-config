vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "c", api.fs.create, opts("Create file"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename a file"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	hijack_directories = {
		enable = true,
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	update_cwd = true,
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		group_empty = true,
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",

			show = {
				git = true,
				file = true,
				folder = true,
				folder_arrow = true,
			},
			glyphs = {
				folder = {
					arrow_closed = "⏵",
					arrow_open = "⏷",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "⌥",
					renamed = "➜",
					untracked = "★",
					deleted = "⊖",
					ignored = "◌",
				},
			},
		},
	},
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore", ".env" },
		dotfiles = true,
	},
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<cr>")
