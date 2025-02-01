local wk = require("which-key")
wk.add({

    -- NeoTree
    {"<leader>n",group="neotree"}, -- group
    {"<leader>nt", "<cmd>Neotree toggle left<cr>",desc = "Toggle File Exlorer"},
    {"<leader>nb", "<cmd>Neotree buffers toggle left<cr>",desc = "Toggle Buffer Exlorer"},
    {"<leader>nf", "<cmd>Neotree float<cr>",desc = "Float"},

    -- Telescope
    {"<leader>t", group = "telescope"}, -- group
    {"<leader>tf","<cmd>Telescope find_files<cr>",desc = "Find File"},
    {"<leader>tg","<cmd>Telescope live_grep<cr>",desc = "Live Grep"},
    {"<leader>tb","<cmd>Telescope buffers<cr>",desc = "Buffers"},
    {"<leader>th","<cmd>Telescope help_tags<cr>",desc = "Help Tags"},

    -- Mason
    --{"<leader>m", "<cmd>Mason<cr>", desc = "Open Mason"},

    -- Lazy
    --{"<leader>l", "<cmd>Lazy<cr>", desc = "Open Lazy"},


    -- LSP
    {"<leader>l", group = "Lsp"}, -- group
    {"<leader>ld","<cmd>lua vim.lsp.buf.definition()<cr>",desc = "Go to Definition"},
    {"<leader>li","<cmd>lua vim.lsp.buf.implementation()<cr>",desc = "Go to Implementation"},
    {"<leader>la","<cmd>lua vim.lsp.buf.code_action()<cr>",desc = "Code Action"},
    {"<leader>ls","<cmd>lua vim.lsp.buf.signature_help()<cr>",desc = "Signature Help"},
    {"<leader>lh","<cmd>lua vim.lsp.buf.hover()<cr>",desc = "Hover"},
    -- Other
    { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
    { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
    },

    {
        mode = {"i"},
        {"<C-h>","<Left>",desc = "Move Left"},
        {"<C-j>","<Down>", desc = "Move down"},
        {"<C-k>","<Up>", desc = "Move up"},
        {"<C-l>","<Right>", desc = "Move right"},
        {"<C-e>","<Esc>", desc = "Exit Insert mode (ESC)"},
    }

})
