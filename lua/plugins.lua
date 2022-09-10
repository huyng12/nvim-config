vim.cmd [[packadd packer.nvim]]

local function setup()
  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- lspconfig and lsp servers manager
    use {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      config = function()
        require('mason').setup()
      end
    }

    -- auto completion
    use {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    }

    -- smart commenting
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
  end)
end

return {
  setup = setup
}

