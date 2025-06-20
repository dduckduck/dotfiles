-- Basic
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.clipboard="unnamedplus"
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldnestmax = 4
vim.wo.foldlevel=99
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
