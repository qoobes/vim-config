require("CopilotChat").setup({
  mode = "split",
  debug = false,
  show_help = "yes",
  prompts = {
    Explain = "Explain how it works",
    Tests = "Briefly explain how the selected code works, then generate unit tests.",
    Review = "Review the following code and provide concise suggestions.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
})

-- Define a function to set key mappings for CopilotChat
local function set_copilot_keymap(key, command, description)
  vim.keymap.set(
    "n",
    "<leader>cc" .. key,
    "<cmd>" .. command .. "<cr>",
    { noremap = true, silent = true, desc = description }
  )

  vim.keymap.set(
    "v",
    "<leader>cc" .. key,
    "y<cmd>" .. command .. "<cr>",
    { noremap = true, silent = true, desc = "Vis mode" .. description }
  )

  vim.keymap.set(
    "v",
    "<leader>cc" .. key,
    "y<cmd>" .. command .. "<cr>",
    { noremap = true, silent = true, desc = "XVis mode" .. description }
  )
end

-- Set key mappings for various CopilotChat commands
set_copilot_keymap("e", "CopilotChatExplain", "Copilot Explain")
set_copilot_keymap("t", "CopilotChatTests", "Copilot Tests")
set_copilot_keymap("r", "CopilotChatReview", "Copilot Review")
set_copilot_keymap("f", "CopilotChatRefactor", "Copilot Refactor")
set_copilot_keymap("s", "CopilotChatStop", "Copilot Stop")

vim.keymap.set("n", "<leader>ccb", ":CopilotChatBuffer ", {
  desc = "Copilot Chat with Buffer",
  noremap = true,
  silent = false,
})

vim.keymap.set("n", "<leader>cci", function()
  local input = vim.fn.input("Ask Copilot: ")
  if input ~= "" then
    vim.cmd("CopilotChat " .. input)
  end
end, {
  noremap = true,
  silent = true,
  desc = "Ask Copilot",
})
