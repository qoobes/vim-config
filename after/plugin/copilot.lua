require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		accept = false,
		keymap = {
			accept = "<tab>",
		},
	},
	filetypes = {
		yaml = true,
		markdown = true,
		gitcommit = true,
		gitrebase = true,
		hgcommit = true,
	},
})

vim.keymap.set("i", "<Tab>", function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, {
	silent = true,
})

-- Old setup
-- require("copilot").setup({
-- 	suggestion = {
-- 		enabled = true,
-- 		auto_trigger = true,
-- 		keymap = {
-- 			accept_word = true,
-- 			accept_line = true,
-- 		},
-- 	},
-- })
--
