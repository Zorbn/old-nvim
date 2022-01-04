require('keybinds')
require('plugins')
require('impatient')

-- Indentation
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = -1
vim.o.shiftwidth = 0

-- Colors
vim.g.tokyonight_style = "night"
vim.cmd("colorscheme tokyonight")
vim.opt.termguicolors = true

-- Lines
vim.o.number = true
vim.o.relativenumber = true

-- LSP
local lsp_installer = require'nvim-lsp-installer'
local capabilities = require'coq'.lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function (server)
    local opts = { capabilities = capabilities }

    server:setup(opts)
end)

vim.diagnostic.config({
    signs = false
})

-- COQ
vim.cmd("COQnow -s")
