local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- Aesthetics
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'bufferline'.setup {} end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup {} end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'indent_blankline'.setup {
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    }

    use { 'folke/tokyonight.nvim' }

    -- File management
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require'telescope'.setup {
                pickers = {
                    find_files = {
                        theme = "ivy"
                    },
                    buffers = {
                        theme = "ivy"
                    }
                },
                extensions = {
                    file_browser = {
                        theme = "ivy"
                    }
                }
            }

            require'telescope'.load_extension "file_browser"
        end
    }

    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Completion
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq'
    }

    use {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts'
    }

    -- Languages
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Ease of use
    use {
        'windwp/nvim-autopairs',
        config = function()
            require'nvim-autopairs'.setup {}
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                toggler = {
                    line  = '<leader>cll',
                    block = '<leader>cbb'
                },
                opleader = {
                    line  = '<leader>cl',
                    block = '<leader>cb'
                },
                extra = {
                    above = '<leader>clO',
                    below = '<leader>clo',
                    eol   = '<leader>clA'
                }
            }
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
