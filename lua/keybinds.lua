local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

-- Nvim Tree
map('n', '<leader>tt', ':NvimTreeToggle<cr>',   { noremap = true })
map('n', '<leader>tr', ':NvimTreeRefresh<cr>',  { noremap = true })
map('n', '<leader>tf', ':NvimTreeFindFile<cr>', { noremap = true })

-- Enter for :
map('n', '<cr>', ':', {})

-- Telescope
map('n', '<leader>ff', ":lua require'telescope'.extensions.file_browser.file_browser()<cr>",  { noremap = true })
map('n', '<leader>fa', ':Telescope find_files<cr>',                                           { noremap = true })
map('n', '<leader>fb', ':Telescope buffers<cr>',                                              { noremap = true })

-- Quick Buffers
map('n', '<leader>bn', ':bn<cr>',   { noremap = true })
map('n', '<leader>bp', ':bp<cr>',   { noremap = true })
map('n', '<leader>bd', ':bd<cr>',   { noremap = true })

-- Quick Splits
map('n', '<leader>sp', ':sp<cr>', { noremap = true })
map('n', '<leader>sv', ':vs<cr>', { noremap = true })
