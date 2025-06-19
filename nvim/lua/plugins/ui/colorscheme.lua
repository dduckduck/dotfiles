return {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        require("kanagawa-paper").setup({
            terminal_colors = true,
        })
        vim.cmd.colorscheme("kanagawa-paper-ink")
    end,
}
