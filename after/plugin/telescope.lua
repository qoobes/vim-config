local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>pv",
-- 	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
-- 	{ noremap = true }
-- )
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<c-b>", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- local fb_actions = require "telescope".extensions.file_browser.actions

require("telescope").setup({
	initial_mode = "normal",
	pickers = {
		live_grep = {
			file_ignore_patterns = { "node_modules", ".git/", ".venv" },
			additional_args = function(_)
				return { "--hidden" }
			end,
		},
		find_files = {
			file_ignore_patterns = { "node_modules", ".git/", ".venv" },
			hidden = true,
		},
	},

	extensions = {
		-- file_browser = {
		-- 	enabled = false,
		-- initial_mode = "normal",
		-- theme = "ivy",
		-- disables netrw and use telescope-file-browser in its place
		-- hijack_netrw = false,
		-- mappings = {
		--   ["i"] = {
		--     -- your custom insert mode mappings
		--   },
		--   ["n"] = {
		--     ["<leader>ff"] = fb_actions.toggle_browser,
		--     ["<leader>nn"] = fb_actions.create
		--   },
		-- },
		-- },
	},
})

-- require("telescope").load_extension("noice")
