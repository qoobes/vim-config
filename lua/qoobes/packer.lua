-- This file can be loaded by calling `lua require('plugins')` from your init.vim Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use("lunarvim/darkplus.nvim")
	use("lunarvim/synthwave84.nvim")
	use("folke/tokyonight.nvim")

	-- use 'rebelot/kanagawa.nvim'

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("theprimeagen/harpoon")

	use("tpope/vim-fugitive")

	use("terrortylor/nvim-comment")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({ "saadparwaiz1/cmp_luasnip" })

	use({ "zbirenbaum/copilot.lua" })

	use("onsails/lspkind.nvim")
	use("nvim-lualine/lualine.nvim")

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("windwp/nvim-ts-autotag")
	use("fsouza/prettierd")
	use("stevearc/dressing.nvim")
	use("MunifTanjim/nui.nvim")
	use("folke/noice.nvim")
	use("tpope/vim-surround")
	use("wakatime/vim-wakatime")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use("mattn/emmet-vim")

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use("moll/vim-bbye")
end)
