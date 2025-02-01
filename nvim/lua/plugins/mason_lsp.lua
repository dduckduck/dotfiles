return {
    -- Mason
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function() require("mason").setup() end
    }, -- Mason LSP
     {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = { auto_install = true },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "pylsp", "lua_ls", "ts_ls" },
            automatic_installation = true
        })
    end
},

{
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    lazy = false,
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({ capabilities = capabilities })
        lspconfig.lua_ls.setup({ capabilities = capabilities })
        lspconfig.pylsp.setup({ capabilities = capabilities })
        lspconfig.ts_ls.setup({ capabilities = capabilities })
    end
},

    -- Null-ls for Prettier
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            -- Configuración de Prettier para formatear el código
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        prefer_local = "node_modules/.bin",  -- Busca Prettier en node_modules local
                    }),
                },
            })

            -- Autoformateo al guardar
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.html", "*.css"},
                callback = function()
                    vim.lsp.buf.format({ async = true })  -- Formatea al guardar
                end,
            })
        end
    },
}


