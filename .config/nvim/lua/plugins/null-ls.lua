return function()
    -- https://github.com/jay-babu/mason-null-ls.nvim
    -- For more options check https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    -- Most of them should be configured out of the box though
    local null_ls = require("null-ls")
    require("mason-null-ls").setup({
        ensure_installed = {},
        automatic_installation = false,
        -- https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
        handlers = {
            -- Confgure ruff separately, not sure why
            ruff = function(_, _)
                null_ls.register(null_ls.builtins.diagnostics.ruff)
            end,
        },
    })
    -- Set up any sources not supported by mason-null-ls
    null_ls.setup({
        sources = {
            -- Use shortcut `gra` to utilize code actions
            -- https://neovim.io/doc/user/lsp/#gra
            null_ls.builtins.code_actions.gitsigns, -- Using "lewis6991/gitsigns.nvim"
            null_ls.builtins.code_actions.refactoring, -- Using "ThePrimeagen/refactoring.nvim"
        },
    })
end
