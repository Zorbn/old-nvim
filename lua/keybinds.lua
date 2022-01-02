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
map('n', '<leader>fg', ':Telescope grep_string<cr>', { noremap = true })
map('n', '<leader>fo', ':Telescope oldfiles<cr>',    { noremap = true })
map('n', '<leader>fm', ':Telescope marks<cr>',       { noremap = true })
map('n', '<leader>fc', ':Telescope git_commits<cr>', { noremap = true })
map('n', '<leader>fs', ':Telescope git_status<cr>',  { noremap = true })
