return {
  {
    'AlexvZyl/nordic.nvim'
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require 'kanagawa'.load()
    end
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function() 
      vim.cmd [[ colorscheme everforest ]]
    end
  }
  -- nvim-juliana
  -- Another really good one to maybe pickup
}
