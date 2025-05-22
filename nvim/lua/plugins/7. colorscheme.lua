return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            term_colors = true,
            default_integrations = true,
        })
        vim.cmd([[colorscheme catppuccin]])
    end,
}
