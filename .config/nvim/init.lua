require("plugins/bootstrapping")

vim.opt.termguicolors = true

require("lazy").setup({
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- Language Servers
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp", -- Completion engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "nvim-neotest/nvim-nio" },
    },
    "saadparwaiz1/cmp_luasnip", -- Snippets
    "jayp0521/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap", -- Debugger
    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup("~/.local/share/debugpy/bin/python")
        end,
    },
    { "theHamsta/nvim-dap-virtual-text", opts = {} }, -- Debugger
    {
        "nvim-neotest/neotest",
        ft = { "python", "rust", "haskell" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "mrcjkb/neotest-haskell",
        },
    }, -- Test system
    "nvimtools/none-ls.nvim",
    {
        "jayp0521/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    }, -- Linter and Formatter
    { "ThePrimeagen/refactoring.nvim", opts = {} }, -- Code Actions
    { "j-hui/fidget.nvim", branch = "legacy" }, -- Shows LSP progress
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax Highlighting
    "nvim-tree/nvim-web-devicons", -- Icons
    "MunifTanjim/nui.nvim",
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", opts = { window = { width = 30 } } }, -- File Explorer
    "onsails/lspkind.nvim", -- Completion Icons
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
    }, -- tabline
    "goolord/alpha-nvim", -- Startup Dashboard
    "rcarriga/nvim-notify", -- Cool way to show notifications
    "rcarriga/nvim-dap-ui", -- Debugger UI
    "stevearc/dressing.nvim",
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = { view = "cmdline" },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
        },
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    }, -- Improved UI
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^3",
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    },
    { "mrcjkb/rustaceanvim", version = "^5", lazy = false },
    { "nvim-lualine/lualine.nvim", opts = { options = { theme = "molokai" } } }, -- Statusline
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "benfowler/telescope-luasnip.nvim", -- Fancy UI thing
    {
        "doctorfree/cheatsheet.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
    }, -- Cheatsheet
    {
        "AckslD/nvim-neoclip.lua",
        opts = {},
        dependencies = { "nvim-telescope/telescope.nvim" },
    }, -- Clipboard history
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } }, -- fancy folding
    {
        "Saecki/crates.nvim",
        tag = "stable",
        event = { "BufRead Cargo.toml" },
    }, -- Rust Crates Completion
    "lewis6991/gitsigns.nvim", -- Git Stuff
    { "smoka7/hop.nvim", tag = "2.7.2" }, -- Quick Navigation
    "numToStr/Comment.nvim", -- Comment Plugin
    "nacro90/numb.nvim", -- Peek lines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Indent lines
    "Shatur/neovim-session-manager", -- Session Manager
    "rafamadriz/friendly-snippets", -- Some Snippets
    { "folke/trouble.nvim", opts = {}, cmd = "Trouble" }, -- List all Diagnostics
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop",
        },
        build = "cd app && yarn install || npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    "folke/which-key.nvim",
    {
        "folke/lazydev.nvim",
        tag = "v1.8.0",
        ft = "lua",
        opts = { library = { path = "luvit-meta/library", words = { "vim%.uv" } } },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    { "maxmx03/fluoromachine.nvim", opts = { theme = "retrowave", glow = true } },
    "EdenEast/nightfox.nvim", -- Theme
    "tiagovla/tokyodark.nvim",
    "shaunsingh/moonlight.nvim",
    "catppuccin/nvim",
    "sekke276/dark_flat.nvim",
    "luisiacc/gruvbox-baby",
    "rebelot/kanagawa.nvim",
    "AlexvZyl/nordic.nvim",
    "marko-cerovac/material.nvim",
    "folke/tokyonight.nvim",
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "zaldih/themery.nvim",
        cmd = { "Themery" },
        opts = require("plugins.themery"),
    },
    { "folke/neoconf.nvim", opts = {} },
})

require("luasnip.loaders.from_vscode").lazy_load()
require("which-key").setup()
require("fidget").setup()
require("gitsigns").setup()
require("hop").setup()
require("Comment").setup()
require("numb").setup()
require("dressing").setup()
require("ibl").setup()
require("bufferline").setup()
require("nvim-web-devicons").setup()
require("neotest").setup({
    adapters = {
        require("rustaceanvim.neotest"),
        require("neotest-python")({ runner = "unittest" }),
        require("neotest-haskell"),
    },
})
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("ui-select")
telescope.load_extension("luasnip")
telescope.load_extension("neoclip")

require("plugins/nvim-treesitter")
require("plugins/nvim-lspconfig")
require("plugins/ufo")
require("plugins/nvim-dap")

-- ufo folding
vim.o.foldcolumn = "3" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Session Manager
require("session_manager").setup({
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
})

-- Alpha
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],
}
require("alpha").setup(dashboard.config)

-- My settings
local ufo = require("ufo")
local dap = require("dap")
local dapui = require("dapui")
local neotest = require("neotest")
local wk = require("which-key")
local builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")
local make_command = vim.api.nvim_create_user_command
vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Custom Commands
make_command("Wq", "wq", {})
make_command("WQ", "wq", {})
make_command("W", "w", {})
make_command("Q", "q", {})
-- Commands for Debugging
make_command("DapUiOpen", dapui.open, {})
make_command("DapUiClose", dapui.close, {})
make_command("DapUiToggle", dapui.toggle, {})
make_command("DapToggleConditionalBreakpoint", function(opts)
    dap.toggle_breakpoint(opts.args)
end, { nargs = 1 })
make_command("DapToggleLogpoint", function(opts)
    dap.toggle_breakpoint(nil, nil, opts.args)
end, { nargs = 1 })
make_command("DapToggleHitBreakpoint", function(opts)
    dap.toggle_breakpoint(nil, opts.args)
end, { nargs = 1 })
-- Commands for testing
make_command("NeotestRun", neotest.run.run, {})
make_command("NeotestRunCurrentFile", function()
    neotest.run.run(vim.fn.expand("%"))
end, {})
make_command("NeotestDebug", function()
    neotest.run.run({ strategy = "dap", suite = false })
end, {})
make_command("NeotestDebugCurrentFile", function()
    neotest.run.run({ vim.fn.expand("%"), strategy = "dap", suite = false })
end, {})
make_command("NeotestStop", neotest.run.stop, {})

-- Filetype specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function() end,
})

-- Neovide specific settings
if vim.g.neovide then
    vim.g.neovide_transparency = 0.9
    vim.keymap.set("n", "<leader><c-v>", '"+P')
    vim.keymap.set("v", "<leader><c-c>", '"+y')
end

-- Register Shortcuts
local gitactions = require("gitsigns.actions")
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
    { "<leader>gs", gitsigns.stage_hunk, desc = "Stage Hunk", mode = "n" },
    { "<leader>gr", gitsigns.reset_hunk, desc = "Reset Hunk", mode = "n" },
    {
        "<leader>gs",
        function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
        desc = "Stage Hunk",
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
    { "<leader>gS", gitsigns.stage_buffer, desc = "Stage buffer" },
    { "<leader>gu", gitsigns.undo_stage_hunk, desc = "Undo Stage hunk" },
    { "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
    { "<leader>gp", gitsigns.previw_hunk, desc = "Preview buffer" },
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
    { "<leader>gx", gitactions.toggle_deleted, desc = "Toggle deleted" },
})
-- Equivalent to:
-- vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
-- vim.keymap.set('n', 'ff', builtin.find_files, {})
-- vim.keymap.set('n', 'fg', builtin.live_grep, {})
-- vim.keymap.set('n', 'fb', builtin.buffers, {})
-- vim.keymap.set('n', 'fh', builtin.help_tags, {})
--
-- For more info check: https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings

vim.opt.fillchars = "fold: "
vim.opt.guifont = "NotoMono Nerd Font"
-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme carbonfox")
vim.g.theme_id = 5
-- end themery block
