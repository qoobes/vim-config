vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)

local target_path = vim.fn.expand("~/.undodir")

-- create the directory and any parent directories
-- if the location does not exist.
if vim.fn.isdirectory(target_path) == 0 then
  os.execute("mkdir -p " .. target_path)
end

vim.o.undodir = target_path
vim.o.undofile = true
