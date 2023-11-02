local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", default_opts)
keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", default_opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", default_opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", default_opts)
keymap("n", "<F9>", "<cmd>lua require'dapui'.toggle()<cr>", default_opts)
keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
	default_opts)
keymap("n", "<Leader>B",
	"Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	default_opts)
