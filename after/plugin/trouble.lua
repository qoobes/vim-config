require("trouble").setup()

local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["†"] = trouble.open_with_trouble },
			n = { ["†"] = trouble.open_with_trouble },
		},
	},
})
