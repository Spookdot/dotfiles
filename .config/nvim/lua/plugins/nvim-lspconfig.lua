-- LSP Settings
-- based on: https://neovim.io/doc/user/lsp/#lsp-attach
-- Disabled since I'd rather format on command rather than on save
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
--     callback = function(ev)
--         local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--         if
--             not client:supports_method("textDocument/willSaveWaitUntil")
--             and client:supports_method("textDocument/formatting")
--         then
--             -- Add automatic format in the saving process before writing the buffer
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
--                 buffer = ev.buf,
--                 callback = function()
--                     vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
--                 end,
--             })
--         end
--     end,
-- })

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {},
    },
})

require("crates").setup({
    lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
    },
    null_ls = {
        enabled = true,
    },
})
