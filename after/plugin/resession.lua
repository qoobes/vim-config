local resession = require("resession")

local function opts(desc)
  return {
    desc = desc,
    silent = true,
    noremap = true,
  }
end

resession.setup({
  autosave = {
    enabled = true,
    interval = 60,
    notify = true,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc(-1) == 0 then
      print("cwd", vim.fn.getcwd())
      resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
    end
  end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
  end,
})

--
-- -- Save session on exit as last
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   callback = function()
--     -- Always save a special session named "last"
--     resession.save("last")
--   end,
-- })
--
-- -- Resession does NOTHING automagically, so we have to set up some keymaps
vim.keymap.set("n", "<leader>ss", resession.save, opts("Save session"))
vim.keymap.set("n", "<leader>sl", resession.load, opts("Load session"))
vim.keymap.set("n", "<leader>sd", resession.delete, opts("Delete session"))
