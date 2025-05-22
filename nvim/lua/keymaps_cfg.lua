local wk = require("which-key")
wk.add({

    -- General
    { "<leader><Tab>", "<cmd>Neotree toggle left<cr>",                    desc = "Toggle File Exlorer" },
    { "<leader>t",    "<cmd>TermNew direction=float<cr>",                   desc = "Open Terminal" },

    -- Telescope
    { "<leader>f",     group = "telescope" },
    { "<leader>fw",    "<cmd>Telescope file_browser<cr>",                   desc = "Open folder" },
    { "<leader>ff",    "<cmd>Telescope find_files<cr>",                   desc = "Find File" },
    { "<leader>fg",    "<cmd>Telescope live_grep<cr>",                    desc = "Live Grep" },
    { "<leader>fs",    "<cmd>Telescope grep_string<cr>",                  desc = "String Grep" },
    { "<leader>fb",    "<cmd>Telescope buffers<cr>",                      desc = "Buffers" },
    { "<leader>fm",    "<cmd>Telescope man_pages<cr>",                    desc = "Manual" },
    { "<leader>fh",    "<cmd>Telescope help_tags<cr>",                    desc = "Help Tags" },

    -- LSP con Telescope
    { "<leader>l",     group = "LSP" }, -- Agrupación para LSP
    { "<leader>ld",    "<cmd>lua vim.lsp.buf.definition()<cr>",           desc = "Go to Definition" },
    { "<leader>li",    "<cmd>lua vim.lsp.buf.implementation()<cr>",       desc = "Go to Implementation" },
    { "<leader>la",    "<cmd>lua vim.lsp.buf.code_action()<cr>",          desc = "Code Action" },
    { "<leader>ls",    "<cmd>lua vim.lsp.buf.signature_help()<cr>",       desc = "Signature Help" },
    { "<leader>lh",    "<cmd>lua vim.lsp.buf.hover()<cr>",                desc = "Hover" },
    { "<leader>lr",    "<cmd>Telescope lsp_references<cr>",               desc = "Find References (Telescope)" },
    { "<leader>lt",    "<cmd>Telescope lsp_type_definitions<cr>",         desc = "Go to Type Definition (Telescope)" },
    { "<leader>lR",    "<cmd>lua vim.lsp.buf.rename()<cr>",               desc = "Rename Symbol" },
    { "<leader>lf",    "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "Format Document" },
    { "<leader>lsd",   "<cmd>Telescope lsp_document_symbols<cr>",         desc = "Document Symbols (Telescope)" },
    { "<leader>lsw",   "<cmd>Telescope lsp_workspace_symbols<cr>",        desc = "Workspace Symbols (Telescope)" },
    { "<leader>le",    "<cmd>Telescope diagnostics<cr>",                  desc = "Show Workspace Diagnostics (Telescope)" },
    { "<leader>lE",    "<cmd>Telescope diagnostics bufnr=0<cr>",          desc = "Show Buffer Diagnostics (Telescope)" },

    -- Other
    { "<leader>w",     proxy = "<c-w>",                                   group = "windows" }, -- proxy to window mappings

    {
        mode = { "i" },
        { "<C-h>", "<Left>",  desc = "Move Left" },
        { "<C-j>", "<Down>",  desc = "Move down" },
        { "<C-k>", "<Up>",    desc = "Move up" },
        { "<C-l>", "<Right>", desc = "Move right" },
        { "<C-e>", "<Esc>",   desc = "Exit Insert mode (ESC)" },
    }

})
