require('plugins/bootstrapping')

vim.opt.termguicolors = true

require("lazy").setup({
    "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",                                  -- Language Servers
    "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline", "hrsh7th/nvim-cmp",                -- Completion engine
    "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",           -- Snippets
    "jayp0521/mason-nvim-dap.nvim", "mfussenegger/nvim-dap",  -- Debugger
    "nvim-lua/plenary.nvim", "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",                            -- Linter and Formatter
    { "j-hui/fidget.nvim",               branch = "legacy" }, -- Shows LSP progress
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax Highlighting
    "kyazdani42/nvim-web-devicons",                           -- Icons
    "MunifTanjim/nui.nvim", "nvim-neo-tree/neo-tree.nvim",    -- File Explorer
    "onsails/lspkind.nvim",                                   -- Completion Icons
    "EdenEast/nightfox.nvim",                                 -- Theme
    {
        "akinsho/bufferline.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        version = "*"
    },                              -- tabline
    "goolord/alpha-nvim",           -- Startup Dashboard
    "rcarriga/nvim-notify",         -- Cool way to show notifications
    "rcarriga/nvim-dap-ui",         -- Debugger UI
    "stevearc/dressing.nvim",       -- Improved UI
    "NTBBloodbath/galaxyline.nvim", -- Statusline
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }, "nvim-telescope/telescope-ui-select.nvim",          -- Fancy UI thing
    "kevinhwang91/promise-async", "kevinhwang91/nvim-ufo", -- fancy folding
    "Saecki/crates.nvim",                                  -- Rust Crates Completion
    "lewis6991/gitsigns.nvim",                             -- Git Stuff
    "phaazon/hop.nvim",                                    -- Quick Navigation
    "numToStr/Comment.nvim",                               -- Comment Plugin
    "nacro90/numb.nvim",                                   -- Peek lines
    "lukas-reineke/indent-blankline.nvim",                 -- Indent lines
    "gelguy/wilder.nvim",                                  -- Fuzzy complete
    "Shatur/neovim-session-manager",                       -- Session Manager
    "rafamadriz/friendly-snippets",                        -- Some Snippets
    "folke/trouble.nvim",                                  -- List all Diagnostics
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"
        },
        build = "cd app && yarn install || npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }
    }, "folke/which-key.nvim"
})

require("luasnip.loaders.from_vscode").lazy_load()
require("which-key").setup()
require("telescope").setup()
require("telescope").load_extension("ui-select")
require("fidget").setup()
require("neo-tree").setup()
require("dapui").setup()
require("crates").setup()
require("gitsigns").setup()
require("hop").setup()
require("Comment").setup()
require("numb").setup()
require("dressing").setup()
require("ibl").setup()
require("bufferline").setup()
require("galaxyline.themes.eviline")

require('plugins/nvim-treesitter')
require('plugins/nvim-lspconfig')
require('plugins/ufo')
require('plugins/nvim-dap')
require('plugins/keymap')

-- wilder
local wilder = require("wilder")
wilder.setup({ modes = { ':', '/', '?' } })
wilder.set_option('renderer',
    wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlights = {
                border = 'Normal' -- highlight to use for the border
            },
            -- 'single', 'double', 'rounded' or 'solid'
            -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
            border = 'rounded',
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() }
        })))

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- ufo folding
vim.o.foldcolumn = '3' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Session Manager
require("session_manager").setup({
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled
})
local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

-- Alpha
local dashboard = require 'alpha.themes.dashboard'
dashboard.section.header.val = {
    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]]
}
require 'alpha'.setup(dashboard.config)

-- My settings
vim.cmd("colorscheme duskfox")
vim.opt.termguicolors = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
vim.opt.fillchars = "fold: "
