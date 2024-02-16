require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {
        desc = "Gitsigns",
      }
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Navigate to next change" })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Navigate to previous change" })

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage current hunk" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset current hunk" })
    map("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Stage selected hunk" })
    map("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Reset selected hunk" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage all changes in buffer" })
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo last hunk stage" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset all changes in buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview current hunk" })
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "Blame current line" })
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blame for current line" })
    map("n", "<leader>hd", gs.diffthis, { desc = "Show diff for current hunk" })
    map("n", "<leader>hD", function()
      gs.diffthis("~")
    end, { desc = "Show diff for current hunk against ~" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted files" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select current hunk" })
  end,
})
