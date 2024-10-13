-- require("tokyonight").setup({
--   -- your configuration comes here
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

function ColorMyPencils(color)
  -- wait for 2 seconds
  color = color or "catppuccin-mocha"

  vim.cmd.colorscheme(color)
  -- vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- ColorMyPencils("rose-pine-main")
-- ColorMyPencils("gruvbox")
-- wait for 2 second before calling

ColorMyPencils("tokyonight")

vim.defer_fn(function()
  ColorMyPencils("tokyonight")
end, 2000)
