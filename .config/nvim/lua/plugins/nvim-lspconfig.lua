-- LSP Settings
local on_attach = function(_, _)
    local _ = { noremap = true, silent = true }
    vim.cmd([[
           augroup fmt
         autocmd!
         autocmd BufWritePre * undojoin | Neoformat
     augroup END
       ]])
end

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {},
    },
})

-- https://github.com/jay-babu/mason-null-ls.nvim
-- For more options check https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
require("mason-null-ls").setup({
    ensure_installed = {},
    automatic_installation = false,
    handlers = {
        ruff = function(_, _)
            null_ls.register(null_ls.builtins.diagnostics.ruff)
        end,
    },
})
null_ls.setup({
    -- sources = { null_ls.builtins.formatting.rustfmt },
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 vim.lsp.buf.format({ bufnr = bufnr })
    --             end,
    --         })
    --     end
    -- end,
})

require("crates").setup({
    lsp = {
        enabled = true,
        on_attach = on_attach,
        actions = true,
        completion = true,
        hover = true,
    },
})
