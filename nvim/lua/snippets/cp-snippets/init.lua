require("snippets.cp-snippets.boilerplates")
require("snippets.cp-snippets.graphs")

vim.keymap.set('n', '<C-b>', ':w<CR>:!g++ % -o %:r && ./%:r<CR>', { silent = true })
