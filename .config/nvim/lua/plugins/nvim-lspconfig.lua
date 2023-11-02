-- LSP Settings
local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
    local opts = {noremap = true, silent = true}
    --    vim.cmd([[
    --        augroup fmt
    --	    autocmd!
    --	    autocmd BufWritePre * undojoin | Neoformat
    --	augroup END
    --    ]])
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"},
        {name = "crates"}
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item) return vim_item end
        })
    }
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
            autostart = true,
            on_attach = on_attach,
            capabilities = capabilities
        })
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            cmd = {"lua-language-server"},
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Setup your lua path
                        path = vim.split(package.path, ";")
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {"vim"}
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                        }
                    }
                }
            }
        })
    end
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.completion.luasnip, null_ls.builtins.formatting.blue,
        null_ls.builtins.formatting.clang_format
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end
})
