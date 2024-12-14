local parrot = require("parrot")

parrot.setup({
	providers = {
		anthropic = {
			api_key = os.getenv("ANTHROPIC_API_KEY"),
		},
	},
})
