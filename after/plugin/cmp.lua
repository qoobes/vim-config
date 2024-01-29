vim.keymap.set("i", "<C-Space>", function()
  vim.lsp.buf.completion()
end, { buffer = 0, remap = false })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  performance = {
    debounce = 10,
  },
  formatting = {
    fields = {
      cmp.ItemField.Kind,
      cmp.ItemField.Abbr,
      cmp.ItemField.Menu,
    },

    format = lspkind.cmp_format({
      before = function(entry, vim_item)
        if entry ~= nil and entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
          vim_item.menu = entry.completion_item.detail
        else
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
        end

        if vim_item.menu ~= nil and string.len(vim_item.menu) > 20 then
          vim_item.menu = string.sub(vim_item.menu, 0, 20) .. "..."
        end

        return vim_item
      end,
      mode = "symbol", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- can also be a function to dynamically calculate max width such as
      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true,
    }),
  },
  preselect = "item",
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      elseif cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        -- elseif require("luasnip").expandable() then
        -- 	require("luasnip").expand()
        -- elseif has_words_before() then
        -- 	cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),
})
