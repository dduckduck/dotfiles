return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,

    config = function()
        require("mason").setup()
        local languages = require("plugins.lsp.languages")
        local mason_ensure_installed = {}
        local treesitter_ensure_installed = {}
        local tools_ensure_installed = {}

        for lang, conf in pairs(languages) do
            if conf.mason then
                table.insert(mason_ensure_installed, conf.mason)
            end
            if conf.treesitter then
                table.insert(treesitter_ensure_installed, conf.treesitter)
            end
            if conf.tools then
                for _, tool in ipairs(conf.tools) do
                    if tool then table.insert(tools_ensure_installed, tool) end
                end
            end
        end

        -- Now tell mason to install lsp servers
        require("mason-lspconfig").setup({
            ensure_installed = mason_ensure_installed,
            automatic_enable = true, --replaced: setup_handlers
        })


        -- Configure treesitter
        require("nvim-treesitter.configs").setup({
            ensure_installed = treesitter_ensure_installed,
            sync_install = false,
            highlight = { enable = true, use_languagetree = true },
            indent = { enable = true },
            folding = { enable = true },
        })

        -- Setup linters, formatters, dap
        require("mason-tool-installer").setup({
            ensure_installed = tools_ensure_installed,
            auto_update = false,
            run_on_start = true,
        })
    end,
}
