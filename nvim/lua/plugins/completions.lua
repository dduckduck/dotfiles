return {

    {'windwp/nvim-autopairs', event = "InsertEnter", config = true},

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets"
        }
    },
    {'hrsh7th/nvim-cmp',
        dependencies = {'hrsh7th/cmp-nvim-lsp-signature-help','hrsh7th/cmp-nvim-lsp'},
        config = function()
            local cmp = require('cmp')
            require("luasnip.loaders.from_vscode").lazy_load()
            local luasnip = require('luasnip')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            -- Configuración de nvim-cmp
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
                    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
                    ['<CR>'] = cmp.mapping.confirm({select = false}), -- Confirm selected item
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item() -- Select the next item in the suggestions
                        else
                            fallback() -- Use the default behavior of <Tab> (e.g., insert a tab character)
                        end
                    end, {"i", "s"}), -- Apply in insert and select modes
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item() -- Select the previous item in the suggestions
                        else
                            fallback() -- Use the default behavior of <S-Tab> (e.g., shift tab character)
                        end
                    end, {"i", "s"}) -- Apply in insert and select modes
                }),
                sources = cmp.config.sources({
                    {name = 'nvim_lsp'},
                    {name = 'luasnip', option = {use_show_condition = false}}, -- Use LuaSnip for snippets
                    {name = 'nvim_lsp_signature_help'},
                    {name = 'buffer'}
                })
            })

        end
    }
}
