return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  version = '*',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim'
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",          desc = "Find in files" },
    { "<leader>fF", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find text" },
    { "<leader>fw", "<cmd>Telescope buffers<cr>",             desc = "Find buffers" },
    { "<leader>fp", "<cmd>Telescope projects<cr>",             desc = "Find projects" }
  },
  config = function ()
    require("project_nvim").setup {}
    require('telescope').load_extension('projects')
  end
}
