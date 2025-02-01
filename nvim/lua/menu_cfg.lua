
local function run_commands()
    vim.defer_fn(function()
        vim.cmd('Neotree')
        vim.defer_fn(function()
            vim.cmd('wincmd l') 
            vim.cmd('Telescope find_files layout_strategy=current_buffer')
        end, 100)
    end, 50)
end

vim.api.nvim_create_autocmd('VimEnter', {
    callback = run_commands
})
