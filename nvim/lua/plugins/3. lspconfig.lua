return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-treesitter/nvim-treesitter", -- Añadimos treesitter aquí
  },
  lazy = false,

  config = function()
    local function load_language_configs()
      local configs = {}
      local files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins/lsp/languages", "*.lua", false, true)

      for _, file in ipairs(files) do
        local modname = file:match("lua/(.+)%.lua$")
        if modname then
          local ok, lang = pcall(require, modname)
          if ok and lang then
            table.insert(configs, lang)
          else
            vim.notify("Error loading LSP config module: " .. modname, vim.log.levels.ERROR)
          end
        end
      end
      return configs
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- Cargar configuraciones de lenguajes
    local lang_configs = load_language_configs()

    local languages = {}
    local treesitter_langs = {}

    for _, lang in ipairs(lang_configs) do
      if lang.server then
        if type(lang.config) == "function" then
          languages[lang.server] = lang.config()
        else
          languages[lang.server] = lang.config or {}
        end
      end

      if lang.treesitter then
        table.insert(treesitter_langs, lang.treesitter)
      end
    end

    -- Herramientas externas
    local tools = require("plugins.lsp.tools").ensure_installed or {}

    -- Mason
    require("mason").setup()

 -- Mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(languages),
  automatic_installation = true,
})


    require("mason-tool-installer").setup({
      ensure_installed = tools,
    })

    -- Treesitter: resaltado, identación, plegado
    require("nvim-treesitter.configs").setup({
      ensure_installed = treesitter_langs,
      sync_install = false,
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
      folding = { enable = true },
    })
  end,
}
