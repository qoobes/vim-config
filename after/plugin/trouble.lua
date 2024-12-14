require("trouble").setup()

local trouble2 = require("trouble.sources.telescope")

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["†"] = trouble2.open },
			n = { ["†"] = trouble2.open },
		},
	},
})
