local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

-- Nvim Tree
map('n', '<leader>tt', ':NvimTreeToggle<cr>',   { noremap = true })
map('n', '<leader>tr', ':NvimTreeRefresh<cr>',  { noremap = true })
map('n', '<leader>tf', ':NvimTreeFindFile<cr>', { noremap = true })

-- Conveniance
map('n', '<leader>n', ':noh<cr>', { noremap = true })

-- Telescope
map('n', '<leader>ff', ":lua require'telescope'.extensions.file_browser.file_browser()<cr>",  { noremap = true })
map('n', '<leader>fa', ':Telescope find_files<cr>',                                           { noremap = true })
map('n', '<leader>fb', ':Telescope buffers<cr>',                                              { noremap = true })
map('n', '<leader>fg', ':Telescope grep_string<cr>', { noremap = true })
map('n', '<leader>fo', ':Telescope oldfiles<cr>',    { noremap = true })
map('n', '<leader>fm', ':Telescope marks<cr>',       { noremap = true })
map('n', '<leader>fc', ':Telescope git_commits<cr>', { noremap = true })
map('n', '<leader>fs', ':Telescope git_status<cr>',  { noremap = true })

-- LSP
map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<cr>',         { noremap = true })
map('n', '<leader>li', ':lua vim.lsp.buf.implementation()<cr>',     { noremap = true })
map('n', '<leader>lR', ':lua vim.lsp.buf.references()<cr>',         { noremap = true })
map('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<cr>',        { noremap = true })
map('n', '<leader>la', ':Telescope lsp_code_actions<cr>',           { noremap = true })
map('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<cr>',         { noremap = true })
map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<cr>',             { noremap = true })

map('n', 'K', ':lua vim.lsp.buf.hover()<cr>',                       { noremap = true })

-- Terminal
map('t', '<esc>', '<C-\\><C-n>', { noremap = true })
