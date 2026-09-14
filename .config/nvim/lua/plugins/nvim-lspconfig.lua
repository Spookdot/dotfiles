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

require("crates").setup({
    lsp = {
        enabled = true,
        on_attach = on_attach,
        actions = true,
        completion = true,
        hover = true,
    },
    null_ls = {
        enabled = true
    }
})
