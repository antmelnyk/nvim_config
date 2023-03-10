-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use('savq/melange-nvim')

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use('nvim-treesitter/playground')

  use('ThePrimeagen/harpoon')

  use('tpope/vim-fugitive')

  use('mbbill/undotree')

  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
      }
    end,
  })

  use('mhartington/formatter.nvim')

  use('freddiehaddad/feline.nvim')

  use('j-hui/fidget.nvim')

  use('nvim-tree/nvim-web-devicons')

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }
end)

