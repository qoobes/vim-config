local function apply_diff_from_clipboard()
	-- Get the diff from the clipboard
	local diff = vim.fn.getreg("+")

	-- Split the diff into lines
	local lines = vim.split(diff, "\n")

	-- Get the current buffer
	local bufnr = vim.api.nvim_get_current_buf()

	-- Initialize variables
	local current_line = 0
	local added_lines = 0

	-- Iterate through the diff lines
	for _, line in ipairs(lines) do
		if line:match("^@@") then
			-- Parse the @@ line to get the starting line number
			local start = tonumber(line:match("^@@ %-%d+,%d+ %+(%d+)"))
			if start then
				current_line = start - 1 + added_lines
			end
		elseif line:match("^%+") and not line:match("^%+%+%+") then
			-- Add lines that start with +
			local content = line:sub(2)
			vim.api.nvim_buf_set_lines(bufnr, current_line, current_line, false, { content })
			current_line = current_line + 1
			added_lines = added_lines + 1
		elseif line:match("^%-") and not line:match("^%-%-%-") then
			-- Remove lines that start with -
			vim.api.nvim_buf_set_lines(bufnr, current_line, current_line + 1, false, {})
		elseif not line:match("^%+") and not line:match("^%-") and not line:match("^@@") then
			-- Move to the next line for context lines
			current_line = current_line + 1
		end
	end

	print("Diff applied successfully!")
end

-- Create a user command to call the function
vim.api.nvim_create_user_command("ApplyDiffFromClipboard", apply_diff_from_clipboard, {})
vim.keymap.set("n", "<leader>dd", ":ApplyDiffFromClipboard<CR>", { noremap = true, silent = true })
