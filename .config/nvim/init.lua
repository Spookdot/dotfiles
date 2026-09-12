require("plugins/bootstrapping")

vim.opt.termguicolors = true

require("lazy").setup({
    -- Manager for Neovim's dependencies such as LSPs and DAPs
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "jsonls" },
        },
    },

    -- Language Servers
    "neovim/nvim-lspconfig",

    -- Tools for easier developing of the Neovim Config itself
    {
        "folke/lazydev.nvim",
        tag = "v1.10.0",
        ft = "lua",
        opts = { library = { path = "luvit-meta/library", words = { "vim%.uv" } } },
    },
    { "Bilal2453/luvit-meta", lazy = true },

    -- Completion engine
    -- View Keymap here: https://cmp.saghen.dev/configuration/keymap.html#presets
    {
        "saghen/blink.cmp",
        dependencies = { "L3MON4D3/LuaSnip", version = 'v2.*' },
        version = "1.*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'enter' },
            completion = {
                list = {
                    selection = {
                        preselect = false
                    }
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 2000,
                },
                ghost_text = {
                    enabled = true
                }
            },
            snippets = { preset = "luasnip" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = {
                    lua = { inherit_defaults = true, "lazydev" }
                },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    }
                }
            },
        }
    },

    -- General dependencies
    "nvim-neotest/nvim-nio", -- Async Neovim (Required for nvim-dap-ui and neotest)
    "nvim-lua/plenary.nvim", -- Required by: neotest, none-ls

    -- DAP for Debugging
    { "jayp0521/mason-nvim-dap.nvim", opts = {} },
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    { "theHamsta/nvim-dap-virtual-text", opts = {} },

    -- Testing
    {
        "nvim-neotest/neotest",
        ft = { "python", "rust", "haskell" },
        dependencies = {
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "mrcjkb/neotest-haskell",
        },
    },

    -- Linting and Formatting
    {
        "jayp0521/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
    },

    -- Keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {}
    },

    { "ThePrimeagen/refactoring.nvim", opts = {} }, -- Code Actions
    { "j-hui/fidget.nvim", opts = {} }, -- Shows LSP progress
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        -- opts = { install_dir = vim.fn.stdpath("data") .. "/site" },
    }, -- Syntax Highlighting
    { "nvim-tree/nvim-web-devicons", opts = {} }, -- Icons
    "MunifTanjim/nui.nvim",
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", opts = { window = { width = 30 } } }, -- File Explorer
    "onsails/lspkind.nvim", -- Completion Icons
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        opts = {},
    }, -- tabline
    "goolord/alpha-nvim", -- Startup Dashboard
    "rcarriga/nvim-notify", -- Cool way to show notifications
    "stevearc/dressing.nvim", -- Consider replacting with: https://github.com/folke/snacks.nvim
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
        version = "^7",
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    }, -- Haskell Tools
    { "mrcjkb/rustaceanvim", version = "^8", lazy = false }, -- Rust tools
    { "nvim-lualine/lualine.nvim", opts = { options = { theme = "molokai" } } }, -- Statusline
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.2.1",
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
    { "lewis6991/gitsigns.nvim", opts = {} }, -- Git Stuff
    { "numToStr/Comment.nvim", opts = {} }, -- Comment Plugin
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
    },  -- Markdown Preview
    "xiyaowong/transparent.nvim", -- Optional Transparency
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
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("ui-select")
telescope.load_extension("luasnip")
telescope.load_extension("neoclip")

require("plugins/nvim-lspconfig")
require("plugins/ufo")
require("plugins/nvim-dap")
require("plugins/neotest")
require("plugins/which-key")

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
local dap = require("dap")
local dapui = require("dapui")
local neotest = require("neotest")
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

vim.opt.fillchars = "fold: "
vim.opt.guifont = "NotoMono Nerd Font"
-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme carbonfox")
vim.g.theme_id = 5
-- end themery block
