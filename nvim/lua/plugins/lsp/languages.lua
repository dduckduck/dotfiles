-- List: https://mason-registry.dev/
return {
    python = {
        mason = "pylsp",
        treesitter = "python",
        tools = { "black", "flake8" }
    },
    rust = {
        mason = "rust_analyzer",
        treesitter = "rust",
        tools = { "rustfmt" }
    },
    lua = {
        mason = "lua_ls",
        treesitter = "lua",
        tools = { "stylua" }
    },
    typescript = {
        mason = "ts_ls",
        treesitter = "typescript",
        tools = { "prettier" }
    },
    markdown = {
        mason = "marksman",
        treesitter = "markdown",
        tools = { "markdownlint" }
    },
    bash = {
        mason = "bashls",
        treesitter = "bash",
        tools = { "shellcheck", "beautysh" }
    },
}
