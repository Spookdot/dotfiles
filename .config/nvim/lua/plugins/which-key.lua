-- Keybindings
local wk = require("which-key")
local ufo = require("ufo")
local dap = require("dap")
local builtin = require("telescope.builtin")
local neotest = require("neotest")
local gitsigns = require("gitsigns")
local gitactions = require("gitsigns.actions")
local refac = require("refactoring")
local refacdebug = require("refactoring.debug")
wk.add({
    { "<leader><Space>", "<cmd>Neotree<cr>", desc = "Open Neotree" },
    -- Telescope Section
    { "<leader>f", group = "Telescope" },
    { "<leader>ff", builtin.find_files, desc = "Find File" },
    { "<leader>fg", builtin.live_grep, desc = "Search through File" },
    { "<leader>fb", builtin.buffers, desc = "List Buffers" },
    { "<leader>fh", builtin.help_tags, desc = "Browse Help Tags" },
    { "<leader>fn", "<cmd>Telescope neoclip<cr>", desc = "Clipboard History" },
    { "<leader>fl", "<cmd>Telescope luasnip<cr>", desc = "Luasnip" },
    { "<leader>fc", "<cmd>Cheatsheet<cr>", desc = "Cheatsheet" },
    -- DAP Section
    { "<leader>d", group = "Dap" },
    { "<leader><CR>", "<cmd>DapContinue<cr>", desc = "Start DAP" },
    { "<leader>u", dap.up, desc = "Move Up in Stack without stepping" },
    { "<leader>d", dap.down, desc = "Move Down in Stack without stepping" },
    -- DAP Breakpoints section
    { "<leader>db", group = "Breakpoints" },
    { "<leader>dbb", dap.toggle_breakpoint, desc = "Add/Remove a Breakpoint" },
    {
        "<leader>dbc",
        function()
            local condition = vim.fn.input("Condition: ", "")
            if condition ~= "" then
                dap.toggle_breakpoint(condition)
            end
        end,
        desc = "Add a Conditional Breakpoint",
    },
    {
        "<leader>dbh",
        function()
            local hitcount = vim.fn.input("Hit Condition: ", "")
            if hitcount ~= "" then
                dap.toggle_breakpoint(nil, hitcount)
            end
        end,
        desc = "Add a Hitcondition Breakpoint",
    },
    {
        "<leader>dbl",
        function()
            local message = vim.fn.input("Log Message: ", "")
            if message ~= "" then
                dap.toggle_breakpoint(nil, nil, message)
            end
        end,
        desc = "Add a Logpoint",
    },
    -- Neotest Section
    { "<leader>t", group = "Neotest" },
    { "<leader>tt", "<cmd>Neotest summary<cr>", desc = "Open Neotest Summary" },
    { "<leader>tr", group = "Run Tests" },
    {
        "<leader>trc",
        function()
            neotest.run.run(vim.fn.expand("%"))
        end,
        desc = "Run test in current file",
    },
    {
        "<leader>trf",
        function()
            local file = vim.fn.input("File: ", "", "file")
            neotest.run.run(file)
        end,
        desc = "Run tests in file",
    },
    { "<leader>td", group = "Debug Tests" },
    {
        "<leader>tdc",
        function()
            neotest.run.run({ vim.fn.expand("%"), strategy = "dap", suite = false })
        end,
        desc = "Run test in current file",
    },
    {
        "<leader>tdf",
        function()
            local file = vim.fn.input("File: ", "", "file")
            neotest.run.run({ file, strategy = "dap", suite = false })
        end,
        desc = "Debug tests in file",
    },
    -- ufo
    { "<leader>z", group = "ufo" },
    { "<leader>zR", ufo.openAllFolds, desc = "Open all Folds" },
    { "<leader>zM", ufo.closeAllFolds, desc = "Close all Folds" },
    -- GitSigns
    { "<leader>g", group = "gitsigns" },
    { "<leader>gs", gitsigns.stage_hunk, desc = "Stage or unstage Hunk", mode = "n" },
    { "<leader>gr", gitsigns.reset_hunk, desc = "Reset Hunk", mode = "n" },
    {
        "<leader>gs",
        function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
        desc = "Stage unstage Hunk",
        mode = "v",
    },
    {
        "<leader>gr",
        function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
        desc = "Reset Hunk",
        mode = "v",
    },
    { "<leader>gS", gitsigns.stage_buffer, desc = "Stage or unstage buffer" },
    { "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
    { "<leader>gp", gitsigns.previw_hunk, desc = "Preview hunk" },
    { "<leader>gx", gitsigns.preview_hunk_inline, desc = "Preview hunk inline" },
    { "<leader>gb", gitactions.toggle_current_line_blame, desc = "Toggle current line blame" },
    {
        "<leader>gB",
        function()
            gitactions.blame_line({ full = true })
        end,
        desc = "Toggle blame",
    },
    { "<leader>gd", gitactions.diffthis, desc = "Show diff to index" },
    {
        "<leader>gD",
        function()
            local commit = vim.fn.input("Commit: ")
            gitactions.diffthis(commit)
        end,
        desc = "Show diff to specific commit",
    },
    -- Refactoring
    { "<leader>r", group = "refactoring" },
    { "<leader>re", refac.extract_func, desc = "Extract Function" },
    { "<leader>rv", refac.extract_var, desc = "Extract Variable" },
    { "<leader>rI", refac.inline_func, desc = "Inline Function" },
    { "<leader>ri", refac.inline_var, desc = "Inline Variable" },
    {
        "<leader>rpv",
        function()
            refacdebug.print_var({ output_location = "below" })
        end,
        desc = "Debug print Variable below",
    },
    {
        "<leader>rpV",
        function()
            refacdebug.print_var({ output_location = "above" })
        end,
        desc = "Debug print Variable above",
    },
    {
        "<leader>rpe",
        function()
            refacdebug.print_exp({ output_location = "below" })
        end,
        desc = "Debug print Expression below",
    },
    {
        "<leader>rpE",
        function()
            refacdebug.print_exp({ output_location = "above" })
        end,
        desc = "Debug print Expression above",
    },
    {
        "<leader>rpl",
        function()
            refacdebug.print_loc({ output_location = "below" })
        end,
        desc = "Debug print Location below",
    },
    {
        "<leader>rpL",
        function()
            refacdebug.print_loc({ output_location = "above" })
        end,
        desc = "Debug print Location above",
    },
    -- Trouble section
    { "<leader>x", group = "Trouble diagnostics" },
    {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
    },
    {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.bug=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
    },
})
-- For more info check: https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings

