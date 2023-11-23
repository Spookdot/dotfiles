require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "rust",
        "python", -- My own
        "vim",
        "regex",
        "lua",
        "bash",
        "markdown",
        "markdown_inline", -- Required for Noice
        "jsonc", -- Part of neoconf
    },
    sync_install = false,
    auto_install = false,
    ignore_install = {},
    modules = {},
})
