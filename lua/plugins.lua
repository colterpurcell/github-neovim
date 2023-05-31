-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

return require('packer').startup(function(use)
    -- ! Package Manager  
    use 'wbthomason/packer.nvim'

    -- ! noice
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true
                    }
                },
                presets = {
                    command_palette = false, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    lsp_doc_border = false -- add a border to hover docs and signature help
                }
            })
        end,
        requires = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
    })

    -- ! notify
    use {
        'rcarriga/nvim-notify',
        config = function()
            require("notify").setup {
                stages = 'static',
                render = 'compact',
                timeout = 3000
            }
            vim.notify = require('notify')
        end
    }

    -- ! Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        require('nvim-treesitter.configs').setup {
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        }
    }

    -- ! nvim-lsp-config
    use 'neovim/nvim-lspconfig'

    -- ! nvim-lsp
    use {
        "williamboman/nvim-lsp-installer",
        config = function ()
            require("nvim-lsp-installer").setup{}
        end
    }

    -- Visualize lsp progress
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end
    })

    -- ! lightline
    use 'itchyny/lightline.vim'

    -- ! copilot
    use 'github/copilot.vim'

    -- ! spaceduck
    use 'pineapplegiant/spaceduck'

    -- ! telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- ! devicons
    use 'nvim-tree/nvim-web-devicons'

    -- ! Polyglot
    use 'sheerun/vim-polyglot'

    -- ! nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }
end)
