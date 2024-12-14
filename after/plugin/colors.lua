-- require("tokyonight").setup({ -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "night",       -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   transparent = false,   -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     -- sidebars = "dark", -- style for sidebars, see below
--     -- floats = "dark", -- style for floating windows
--   },
-- })

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm",       -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true,    -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
})
vim.opt.laststatus = 3 -- Or 3 for global statusline
vim.opt.statusline = " %f %m %= %l:%c ♥ "

function ColorMyPencils(color, blackout)
  color = color or "catppuccin-mocha"

  if color == "rose-pine-moon" then
    require("rose-pine").setup({
      disable_background = true,
      floats = "transparent",
      sidebars = "transparent",
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
      palette = {
        -- Override the builtin palette per variant
        moon = {
          base = "#000000",
          overlay = "#000000",
        },
      },

      highlight_groups = {
        StatusLine = { fg = "love", bg = "love", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },

        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "base" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "base" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },

        -- NvimTree
        NvimTreeNormal = { fg = "text", bg = "none" },
        NvimTreeNormalNC = { fg = "text", bg = "none" },
        NvimTreeRootFolder = { fg = "rose", bg = "none" },
        NvimTreeGitDirty = { fg = "rose", bg = "none" },
        NvimTreeGitNew = { fg = "rose", bg = "none" },
        NvimTreeGitDeleted = { fg = "rose", bg = "none" },
        NvimTreeSpecialFile = { fg = "rose", bg = "none" },
        NvimTreeIndentMarker = { fg = "rose", bg = "none" },
        NvimTreeImageFile = { fg = "rose", bg = "none" },
        NvimTreeSymlink = { fg = "rose", bg = "none" },

        -- floats
        FloatTitle = { fg = "rose", bg = "none" },
        NormalFloat = { fg = "text", bg = "none" },
        FloatBorder = { fg = "rose", bg = "none" },
      },
    })
  end

  vim.cmd.colorscheme(color)

  if blackout == true then
    vim.cmd.highlight("Normal", "guibg=black", "ctermbg=black")
    vim.api.nvim_set_hl(1, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

-- ColorMyPencils("gruvbox")
-- wait for 2 second before calling
--
-- ColorMyPencils("tokyonight")

ColorMyPencils("catppuccin-mocha", true)
vim.defer_fn(function()
  ColorMyPencils("catppuccin-mocha", true)
end, 1000)
