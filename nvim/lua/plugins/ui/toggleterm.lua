return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup {
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
}
