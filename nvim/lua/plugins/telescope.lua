return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,
                    },
                    vertical = {
                        preview_height = 0.4,
                    },
                },
            },
        }
    end,
}

