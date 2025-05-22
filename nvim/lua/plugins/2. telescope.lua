return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local actions = require('telescope.actions')
            require('telescope').setup {
                defaults = {
                    layout_strategy = 'horizontal',
                    layout_config = {
                        horizontal = { preview_width = 0.3 },
                        vertical = { preview_height = 0.4 },
                    },
                    initial_mode = "normal",
                    mappings = {
                        i = {
                            ["<C-e>"] = actions.close,
                        },
                        n = {
                            ["<leader>q"] = actions.close,
                        },
                    },
                },
            }
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup{
                size = 20,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,
                persist_size = true,
                direction = "horizontal",
                close_on_exit = true,
                shell = vim.o.shell,
            }
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },
}

