return {

    -- Autopairs: cierra automáticamente paréntesis, comillas, etc.
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

    -- Snippets: motor y colección
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",           -- Fuente de snippets para nvim-cmp
            "rafamadriz/friendly-snippets"        -- Colección de snippets predefinidos
        }
    },

    -- Autocompletado principal
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            -- Cargar snippets VSCode-style
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Integrar nvim-autopairs con confirmaciones de cmp
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<CR>']  = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" })
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', option = { use_show_condition = false } },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'buffer' }
                })
            })
        end
    },
}

