local wk = require("which-key")
wk.add({

    -- Misc
    { "<leader>t",   "<cmd>TermNew direction=float<cr>",                desc = "Open Terminal" },

    -- Telescope
    { "<leader>f",   group = "telescope" },
    { "<leader>fw",  "<cmd>Telescope file_browser<cr>",                 desc = "Open folder" },
    { "<leader>fls",  "<cmd>Telescope session-lens<cr>",                 desc = "Sessions" },
    { "<leader>ff",  "<cmd>Telescope find_files<cr>",                   desc = "Find File" },
    { "<leader>fg",  "<cmd>Telescope live_grep<cr>",                    desc = "Live Grep" },
    { "<leader>fs",  "<cmd>Telescope grep_string<cr>",                  desc = "String Grep" },
    { "<leader>fb",  "<cmd>Telescope buffers<cr>",                      desc = "Buffers" },
    { "<leader>fm",  "<cmd>Telescope man_pages<cr>",                    desc = "Manual" },
    { "<leader>fh",  "<cmd>Telescope help_tags<cr>",                    desc = "Help Tags" },
    -- Git
    { "<leader>g",   name = "+Git" },

    -- Telescope Git
    { "<leader>gs",  "<cmd>Telescope git_status<cr>",                   desc = "Git Status" },
    { "<leader>gc",  "<cmd>Telescope git_commits<cr>",                  desc = "Git Commits" },
    { "<leader>gb",  "<cmd>Telescope git_branches<cr>",                 desc = "Git Branches" },
    { "<leader>gB",  "<cmd>Telescope git_bcommits<cr>",                 desc = "Buffer Commits" },
    { "<leader>gf",  "<cmd>Telescope git_files<cr>",                    desc = "Git Files" },

    -- Gitsigns
    { "<leader>gh",  "<cmd>Gitsigns preview_hunk<cr>",                  desc = "Preview Hunk" },
    { "<leader>gr",  "<cmd>Gitsigns reset_hunk<cr>",                    desc = "Reset Hunk" },
    { "<leader>gR",  "<cmd>Gitsigns reset_buffer<cr>",                  desc = "Reset Buffer" },
    { "<leader>gp",  "<cmd>Gitsigns stage_hunk<cr>",                    desc = "Stage Hunk" },
    { "<leader>gP",  "<cmd>Gitsigns stage_buffer<cr>",                  desc = "Stage Buffer" },
    { "<leader>gu",  "<cmd>Gitsigns undo_stage_hunk<cr>",               desc = "Undo Stage Hunk" },
    { "<leader>gd",  "<cmd>Gitsigns diffthis<cr>",                      desc = "Diff (vs index)" },
    { "<leader>gD",  "<cmd>Gitsigns toggle_deleted<cr>",                desc = "Toggle Deleted" },
    { "<leader>gl",  "<cmd>Gitsigns blame_line<cr>",                    desc = "Blame Line" },

    -- LSP Group
    { "<leader>l",   name = "+LSP" },
    -- Navigation
    { "<leader>ld",  "<cmd>lua vim.lsp.buf.definition()<cr>",           desc = "Go to Definition" },
    { "<leader>li",  "<cmd>lua vim.lsp.buf.implementation()<cr>",       desc = "Go to Implementation" },
    { "<leader>lt",  "<cmd>Telescope lsp_type_definitions<cr>",         desc = "Go to Type Definition" },
    { "<leader>lr",  "<cmd>Telescope lsp_references<cr>",               desc = "Find References" },

    --Actions
    { "<leader>la",  "<cmd>lua vim.lsp.buf.code_action()<cr>",          desc = "Code Action" },
    { "<leader>lR",  "<cmd>lua vim.lsp.buf.rename()<cr>",               desc = "Rename Symbol" },
    { "<leader>lf",  "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "Format Document" },

    --Information
    { "<leader>lh",  "<cmd>lua vim.lsp.buf.hover()<cr>",                desc = "Hover (Info)" },
    { "<leader>ls",  name = "+Symbols" },
    { "<leader>lss", "<cmd>lua vim.lsp.buf.signature_help()<cr>",       desc = "Signature Help" },
    { "<leader>lsd", "<cmd>Telescope lsp_document_symbols<cr>",         desc = "Document Symbols" },
    { "<leader>lsw", "<cmd>Telescope lsp_workspace_symbols<cr>",        desc = "Workspace Symbols" },

    -- Diagnostics
    { "<leader>le",  name = "+Errors" },
    { "<leader>lew", "<cmd>Telescope diagnostics<cr>",                  desc = "Workspace Diagnostics" },
    { "<leader>leb", "<cmd>Telescope diagnostics bufnr=0<cr>",          desc = "Buffer Diagnostics" },
    -- Other
    { "<leader>w",   proxy = "<c-w>",                                   group = "windows" }, -- proxy to window mappings

    {
        mode = { "i" },
        { "<C-h>", "<Left>",  desc = "Move Left" },
        { "<C-j>", "<Down>",  desc = "Move down" },
        { "<C-k>", "<Up>",    desc = "Move up" },
        { "<C-l>", "<Right>", desc = "Move right" },
        { "<C-e>", "<Esc>",   desc = "Exit Insert mode (ESC)" },
    }

})
