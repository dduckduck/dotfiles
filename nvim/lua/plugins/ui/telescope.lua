return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        local function multiopen(prompt_bufnr)
            local picker = action_state.get_current_picker(prompt_bufnr)
            local multi = picker:get_multi_selection()

            if not vim.tbl_isempty(multi) then
                actions.close(prompt_bufnr)
                for _, j in pairs(multi) do
                    if j.path ~= nil then
                        local path = vim.fn.fnameescape(j.path)
                        if j.lnum ~= nil then
                            vim.cmd(string.format("silent! edit +%d %s", j.lnum, path))
                        else
                            vim.cmd(string.format("silent! edit %s", path))
                        end
                    end
                end
            else
                actions.select_default(prompt_bufnr)
            end
        end

        require('telescope').setup {
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = { preview_width = 0.7 },
                    vertical = { preview_height = 0.4 },
                },
                initial_mode = "normal",
                mappings = {
                    i = {
                        ["<C-e>"] = actions.close,
                        ["<C-d>"] = actions.delete_buffer,
                        ["<CR>"] = multiopen,
                    },
                    n = {
                        ["<leader>q"] = actions.close,
                        ["<C-d>"] = actions.delete_buffer,
                        ["<CR>"] = multiopen,
                    },
                },
            },
            pickers = {
                diagnostics = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        preview_height = 0.7,
                    },
                },
            },
        }
    end,
}
