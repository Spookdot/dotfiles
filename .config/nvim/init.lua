require("plugins/bootstrapping")

vim.opt.termguicolors = true

require("lazy").setup({
    -- Language Servers
    "neovim/nvim-lspconfig",

    -- Manager for Neovim's dependencies such as LSPs and DAPs
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "jsonls" },
        },
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        }
    },

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
    {
        "L3MON4D3/LuaSnip",
        version = 'v2.*',
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },

    -- General dependencies
    "nvim-lua/plenary.nvim", -- Required by: Not sure this is actually required? Neotest, none-ls
    { "nvim-tree/nvim-web-devicons", opts = {} }, -- Icons, Required by: neotree, bufferline, alpha-nvim

    -- DAP for Debugging
    { "jayp0521/mason-nvim-dap.nvim", opts = {} },
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap" } },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },

    -- Testing
    {
        "nvim-neotest/neotest",
        ft = { "python", "rust", "haskell" },
        dependencies = {
            "nvim-neotest/nvim-nio",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "mrcjkb/neotest-haskell",
        },
    },

    -- Linting and Formatting
    "nvimtools/none-ls.nvim",
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

    -- File Explorer 
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        --- @module 'neo-tree'
        --- @type neotree.Config
        opts = {
            window = { width = 30 },
            filesystem = {
                -- Use OS level file watcher instead of autocmd
                use_libuv_file_watcher = true
            }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- Line that shows the buffers at the top
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        opts = {},
    },

    -- Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
    },

    { "ThePrimeagen/refactoring.nvim", opts = {} }, -- Code Actions
    { "j-hui/fidget.nvim", opts = {} }, -- Shows LSP progress

    -- Startup Dashboard
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    -- Cool way to show notifications
    -- if you ever miss one, use `:Telescope notify` to scroll through them
    "rcarriga/nvim-notify",

    -- Improved UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = { view = "cmdline" },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
        },
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    },

    -- Haskell Tools
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^10",
        lazy = false,
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },

    -- Rust tools
    { "mrcjkb/rustaceanvim", version = "^9", lazy = false },
    {
        "Saecki/crates.nvim",
        tag = "stable",
        event = { "BufRead Cargo.toml" },
    },

    -- Statusline (The one at the bottom)
    {
        "nvim-lualine/lualine.nvim",
        --- @module "lualine.config"
        opts = {
            options = { theme = "molokai" }
        }
    },

    -- Fuzzy finder to browse files and help and other
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.2.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
    },
    "nvim-telescope/telescope-ui-select.nvim", -- Removing this breaks shit
    "benfowler/telescope-luasnip.nvim", -- this too

    -- Clipboard history
    -- Remember this for clipboard usage:
    -- https://stackoverflow.com/questions/1497958/how-do-i-use-vim-registers
    {
        "AckslD/nvim-neoclip.lua",
        opts = {},
        dependencies = { "nvim-telescope/telescope.nvim" },
    },

    -- Cheatsheet
    {
        "doctorfree/cheatsheet.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
    },

    -- fancy folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        }
    },

    -- Git Stuff
    {
        "lewis6991/gitsigns.nvim",
        opts = {}
    },

    -- Comment Plugin
    -- Use Visual mode with
    -- gc - Linewise comment
    -- gb - Blockwise comment
    {
        "numToStr/Comment.nvim", opts = {}
    },

    -- Session Manager
    {
        "Shatur/neovim-session-manager",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },

    -- Diagnostics and other lists
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- Markdown Preview
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

    -- General Visual stuff
    "nacro90/numb.nvim", -- Preview a line before you jump there with :120 or :23
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Indent lines

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
        lazy = false,
        opts = require("plugins.themery"),
    },
    "stevearc/dressing.nvim", -- Consider replacting with: https://github.com/folke/snacks.nvim
})

local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("ui-select")
telescope.load_extension("luasnip")
telescope.load_extension("neoclip")

require("plugins/nvim-lspconfig")
require("plugins/null-ls")
require("plugins/ufo")
require("plugins/nvim-dap")
require("plugins/neotest")
require("plugins/alpha")
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
