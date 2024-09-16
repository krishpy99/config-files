vim.opt.nu = true
vim.opt.rnu = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
