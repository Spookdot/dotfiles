-- LSP Settings
local lspconfig = require("lspconfig")
local on_attach = function(_, _)
    local _ = { noremap = true, silent = true }
    vim.cmd([[
           augroup fmt
         autocmd!
         autocmd BufWritePre * undojoin | Neoformat
     augroup END
       ]])
end

lspconfig.glslls.setup({})

-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local cmp = require("cmp")
cmp.setup({
    enable = true,
    preselect = cmp.PreselectMode.None,
    completion = { keyword_length = 2 },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "crates" },
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(_, vim_item)
                return vim_item
            end,
        }),
        -- kind is the icon, abbr is what kind of thing it is like "Snippet" and menu is the rest
        fields = { "menu", "abbr", "kind" },
        expandable_indicator = true,
    },
})

require("mason").setup() -- {ui = {width = 200}})
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "jsonls" },
})
require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup({
            autostart = true,
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
    ["rust_analyzer"] = function()
        require("rust-tools").setup({})
    end,
    ["pylsp"] = function()
        lspconfig.pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "E303", "W503", "W504" },
                            maxLineLength = 200,
                        },
                    },
                },
            },
        })
    end,
})

-- https://github.com/jay-babu/mason-null-ls.nvim
-- For more options check https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "blue", "clang_format" },
    automatic_installation = false,
    handlers = {},
})
local null_ls = require("null-ls")
null_ls.setup({
    sources = {},
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
