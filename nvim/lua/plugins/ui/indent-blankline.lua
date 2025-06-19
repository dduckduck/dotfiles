return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = '┊',
            highlight = { "IblIndent" },
        },
        scope = {
            enabled = true,
            show_start = true,
            highlight = "IblScope",
        },
    },
}
