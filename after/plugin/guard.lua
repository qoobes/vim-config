-- local ft = require("guard.filetype")
-- local lint = require("guard.lint")
--
-- local function getEslintConfig(linter)
-- 	return {
-- 		cmd = "eslint_d",
-- 		args = { "--format", "json", "--stdin", "--stdin-filename" },
-- 		stdin = true,
-- 		fname = true,
-- 		find = {
-- 			".eslintrc.js",
-- 			".eslintrc.cjs",
-- 			".eslintrc.yaml",
-- 			".eslintrc.yml",
-- 			".eslintrc.json",
-- 		},
-- 		parse = linter.from_json({
-- 			get_diagnostics = function(...)
-- 				print(...)
-- 				local decoded = vim.json.decode(...)
--
-- 				for i = 1, #decoded[1].messages do
-- 					if decoded[1].messages[i].message then
-- 						decoded[1].messages[i].message = decoded[1].messages[i].message .. " "
-- 					end
-- 				end
--
-- 				return decoded[1].messages
-- 			end,
-- 			attributes = {
-- 				lnum = "line",
-- 				end_lnum = "endLine",
-- 				col = "column",
-- 				end_col = "endColumn",
-- 				message = "message",
-- 				code = "ruleId",
-- 			},
-- 			severities = {
-- 				linter.severities.warning,
-- 				linter.severities.error,
-- 			},
-- 			source = "eslint_d",
-- 		}),
-- 	}
-- end
--
-- local function getPrettierDConfig()
-- 	return {
-- 		cmd = "prettier",
-- 		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
-- 		stdin = true,
-- 	}
-- end
--
-- ft("typescript,javascript,typescriptreact,javascriptreact"):fmt({
-- 	cmd = "prettier",
-- 	args = { "--stdin-filepath" },
-- 	fname = true,
-- 	stdin = true,
-- }):lint(getEslintConfig(lint))
--
-- ft("json", {
-- 	-- prettierd
-- 	formatCommand = "prettierd ${INPUT}",
-- 	formatStdin = true,
-- })
--
-- ft("html", {
-- 	-- prettierd
-- 	formatCommand = "prettierd ${INPUT}",
-- 	formatStdin = true,
-- })
--
-- ft("css", {
-- 	-- prettierd
-- 	formatCommand = "prettierd ${INPUT}",
-- 	formatStdin = true,
-- })
--
-- ft("scss", {
-- 	-- prettierd
-- 	formatCommand = "prettierd ${INPUT}",
-- 	formatStdin = true,
-- })
--
-- ft("markdown", {
-- 	-- prettierd
-- 	formatCommand = "prettierd ${INPUT}",
-- 	formatStdin = true,
-- })
--
-- ft("lua"):fmt("lsp"):append("stylua")
--
-- ft("python", {
-- 	-- black
-- 	formatCommand = "black --quiet -",
-- 	formatStdin = true,
-- })
--
-- ft("rust", {
-- 	-- rustfmt
-- 	formatCommand = "rustfmt --emit=stdout",
-- 	formatStdin = true,
-- })
--
-- ft("go", {
-- 	-- gofmt
-- 	formatCommand = "gofmt",
-- 	formatStdin = true,
-- })
--
-- print("starting guard")
-- require("guard").setup({
-- 	-- the only options for the setup function
-- 	fmt_on_save = true,
-- 	-- Use lsp if no formatter was defined for this filetype
-- 	lsp_as_default_formatter = false,
-- })