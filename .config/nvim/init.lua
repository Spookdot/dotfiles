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
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
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
        ft = { "python", "rust" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "rouge8/neotest-rust",
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
    { "j-hui/fidget.nvim", branch = "legacy" }, -- Shows LSP progress
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax Highlighting
    "nvim-tree/nvim-web-devicons", -- Icons
    "MunifTanjim/nui.nvim",
    { "nvim-neo-tree/neo-tree.nvim", opts = { window = { width = 30 } } }, -- File Explorer
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
    { "simrat39/rust-tools.nvim", ft = { "rust", "toml" } },
    { "nvim-lualine/lualine.nvim", opts = { options = { theme = "molokai" } } }, -- Statusline
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
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
        dependencies = { "nvim-telescope/telescope.nvim" },
    }, -- Clipboard history
    "kevinhwang91/promise-async",
    "kevinhwang91/nvim-ufo", -- fancy folding
    "Saecki/crates.nvim", -- Rust Crates Completion
    "lewis6991/gitsigns.nvim", -- Git Stuff
    "phaazon/hop.nvim", -- Quick Navigation
    "numToStr/Comment.nvim", -- Comment Plugin
    "nacro90/numb.nvim", -- Peek lines
    "lukas-reineke/indent-blankline.nvim", -- Indent lines
    "gelguy/wilder.nvim", -- Fuzzy complete
    "Shatur/neovim-session-manager", -- Session Manager
    "rafamadriz/friendly-snippets", -- Some Snippets
    "folke/trouble.nvim", -- List all Diagnostics
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
    { "folke/neodev.nvim", opts = { library = { plugins = true, types = true } } }, -- Sets Neovim up to better write configs
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
        "zaldih/themery.nvim",
        cmd = { "Themery" },
        opts = require("plugins.themery"),
    },
    { "folke/neoconf.nvim", opts = {} },
})

require("luasnip.loaders.from_vscode").lazy_load()
require("which-key").setup()
require("fidget").setup()
require("crates").setup()
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
        require("neotest-rust")({ dap_adapter = "lldb" }),
        require("neotest-python")({ runner = "unittest" }),
    },
})
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("ui-select")
telescope.load_extension("luasnip")

require("plugins/nvim-treesitter")
require("plugins/nvim-lspconfig")
require("plugins/ufo")
require("plugins/nvim-dap")

-- wilder
local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })
wilder.set_option("pipeline", {
    wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
})
wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        highlights = {
            border = "Normal", -- highlight to use for the border
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = "rounded",
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
    }))
)

-- ufo folding
vim.o.foldcolumn = "3" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

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
local dap = require("dap")
local dapui = require("dapui")
local neotest = require("neotest")
local wk = require("which-key")
local rust_tools = require("rust-tools")
local builtin = require("telescope.builtin")
local make_command = vim.api.nvim_create_user_command
vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

make_command("Wq", "wq", {})
make_command("WQ", "wq", {})
make_command("W", "w", {})
make_command("Q", "q", {})
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
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        rust_tools.inlay_hints.enable()
    end,
})
if vim.g.neovide then
    vim.g.neovide_transparency = 0.9
    vim.keymap.set("n", "<leader><c-v>", '"+P')
    vim.keymap.set("v", "<leader><c-c>", '"+y')
end

-- Register Shortcuts
wk.register({
    ["<Space>"] = { "<cmd>Neotree<cr>", "Open Neotree" },
    -- Telescope section
    f = {
        name = "Telescope",
        f = { builtin.find_files, "Find File" },
        g = { builtin.live_grep, "Search through File" },
        b = { builtin.buffers, "List Buffers" },
        h = { builtin.help_tags, "Browse Help Tags" },
        n = { "<cmd>Telescope neoclip<cr>", "Clipboard History" },
        l = { "<cmd>Telescope luasnip<cr>", "Luasnip" },
        c = { "<cmd>Cheatsheet<cr>", "Cheatsheet" },
    },
    -- Dap Section
    d = {
        name = "Dap",
        ["<CR>"] = { "<cmd>DapContinue<cr>", "Start DAP" },
        u = { dap.up, "Move Up in Stack without stepping" },
        d = { dap.down, "Move Down in Stack without stepping" },
        b = {
            name = "Breakpoints",
            b = { dap.toggle_breakpoint, "Add/Remove a Breakpoint" },
            c = {
                function()
                    local condition = vim.fn.input("Condition: ", "")
                    if condition ~= "" then
                        dap.toggle_breakpoint(condition)
                    end
                end,
                "Add a Conditional Breakpoint",
            },
            h = {
                function()
                    local hitcount = vim.fn.input("Hit Condition: ", "")
                    if hitcount ~= "" then
                        dap.toggle_breakpoint(nil, hitcount)
                    end
                end,
                "Add a Hitcondition Breakpoint",
            },
            l = {
                function()
                    local message = vim.fn.input("Log Message: ", "")
                    if message ~= "" then
                        dap.toggle_breakpoint(nil, nil, message)
                    end
                end,
                "Add a Logpoint",
            },
        },
    },
    -- Neotest Section
    t = {
        name = "Neotest",
        t = { "<cmd>Neotest summary<cr>", "Open Neotest Summary" },
        r = {
            name = "Run Tests",
            c = {
                function()
                    neotest.run.run(vim.fn.expand("%"))
                end,
                "Run test in current file",
            },
            f = {
                function()
                    local file = vim.fn.input("File: ", "", "file")
                    neotest.run.run(file)
                end,
                "Run tests in file",
            },
        },
        d = {
            name = "Debug Tests",
            c = {
                function()
                    neotest.run.run({ vim.fn.expand("%"), strategy = "dap", suite = false })
                end,
                "Run test in current file",
            },
            f = {
                function()
                    local file = vim.fn.input("File: ", "", "file")
                    neotest.run.run({ file, strategy = "dap", suite = false })
                end,
                "Debug tests in file",
            },
        },
    },
}, { prefix = "<Leader>" })
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
