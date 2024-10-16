-- This file can be loaded by calling `lua require('plugins')` from your init.vim Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "stevearc/resession.nvim",
    config = function()
      require("resession").setup()
    end,
  })

  use("christoomey/vim-tmux-navigator")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- Colourschemes
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  -- use("lunarvim/darkplus.nvim")
  -- use("lunarvim/synthwave84.nvim")
  use("folke/tokyonight.nvim")
  -- use("Mofiqul/vscode.nvim")
  -- use("marko-cerovac/material.nvim")
  -- use("lunarvim/colorschemes")

  -- use 'rebelot/kanagawa.nvim'

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  use("theprimeagen/harpoon")

  use("tpope/vim-fugitive")

  use("nvimtools/none-ls-extras.nvim")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "nvimtools/none-ls.nvim",
        requires = {
          "nvimtools/none-ls-extras.nvim",
        },
      },
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
  })

  use({ "saadparwaiz1/cmp_luasnip" })

  -- use({ "zbirenbaum/copilot.lua" })

  use("onsails/lspkind.nvim")
  use("nvim-lualine/lualine.nvim")
  -- use("AndreM222/copilot-lualine")

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

  -- use({
  -- 	"stevearc/conform.nvim",
  -- 	config = function()
  -- 		require("conform").setup()
  -- 	end,
  -- })
  --
  use("mhartington/formatter.nvim")

  use("mattn/emmet-vim")

  use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
  use("moll/vim-bbye") -- For deleting buffers
  use("RRethy/vim-illuminate")
  use("folke/todo-comments.nvim")

  use("folke/which-key.nvim")

  use("theprimeagen/vim-apm")
  use("folke/trouble.nvim")

  -- commenting
  use("numToStr/Comment.nvim")

  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Vscode style quick view window
  use("DNLHC/glance.nvim")

  use("fladson/vim-kitty")
  -- use("numToStr/FTerm.nvim")
  --
  use({ "akinsho/toggleterm.nvim", tag = "*" })

  -- use({
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  -- })

  use({ "edluffy/hologram.nvim" })

  use("brooth/far.vim")
  use("junegunn/rainbow_parentheses.vim")
  use("lewis6991/gitsigns.nvim")

  use("mbbill/undotree")
  use("folke/zen-mode.nvim")
  -- use("aserowy/tmux.nvim")

  use("backdround/global-note.nvim")

  use({
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  })
  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  use({ "ellisonleao/gruvbox.nvim" })

  -- Search and replace stuff
  --
  use("nvim-pack/nvim-spectre")
  use("iamyoki/buffer-reopen.nvim")

  -- ai stuff
  use("frankroeder/parrot.nvim")
end)
