local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  -- use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Themeing
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "lunarvim/colorschemes" }

  --   use "lunarvim/darkplus.nvim"

  -- Bufferline - the top buffer tabs
  use { "moll/vim-bbye" }
  use { "akinsho/bufferline.nvim",
    commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4",
    config = function() pcall(require, 'plugins.bufferline') end
  }

  -- Lualine - the bottom line
  use { "nvim-lualine/lualine.nvim",
    commit = "a52f078026b27694d2290e34efa61a6e4a690621",
    config = function() pcall(require, 'plugins.lualine') end
  }

  -- Nvim Tree
  use { "kyazdani42/nvim-tree.lua",
    commit = "7282f7de8aedf861fe0162a559fc2b214383c51c",
    config = function() pcall(require, 'plugins.nvim-tree') end
  }

  -- Telescope
  use { "nvim-telescope/telescope.nvim",
    commit = "76ea9a898d3307244dce3573392dcf2cc38f340f",
    config = function() pcall(require, 'plugins.telescope') end
  }

  -- Git
  use { "lewis6991/gitsigns.nvim",
    commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2",
    config = function() pcall(require, 'plugins.gitsigns') end
  }
  -- Code manipulation
  --use {
  --  'nvim-treesitter/nvim-treesitter',
  --  config = function() pcall(require, 'plugins.treesitter') end,
  -- }
  -- use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use {
    'numToStr/Comment.nvim',
    config = function() 
      require('Comment').setup({})
    end,
  }

  -- Utilities
  use { "goolord/alpha-nvim",
    commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31",
    config = function() pcall(require, 'plugins.alpha') end
  }
  use { "folke/which-key.nvim",
    config = function() pcall(require, 'plugins.whichkey') end
  }
  use { "akinsho/toggleterm.nvim",
    commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
    config = function() pcall(require, 'plugins.toggleterm') end
  }
  use { "ahmedkhalf/project.nvim",
    commit = "628de7e433dd503e782831fe150bb750e56e55d6",
    config = function() pcall(require, 'plugins.project') end
  }
  use { 'tpope/vim-surround' }
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

  -- LSP
  use { "jose-elias-alvarez/null-ls.nvim",
    config = function() pcall(require, 'plugins.lsp.null_ls') end } -- for formatters and linters
  -- use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  use { "neovim/nvim-lspconfig",
    config = function() pcall(require, 'plugins.lsp') end,
    requires = {
      'j-hui/fidget.nvim',
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    }
  } -- enable LSP

  -- use { "adelarsq/neofsharp.vim" }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Autocomplete
  use { "hrsh7th/nvim-cmp", -- The completion plugin
    config = function() pcall(require, 'plugins.cmp') end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-path", -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
