
return { 'nvim-telescope/telescope.nvim',
    lazy = false,
    version = '*', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find in files" }, 
        { "<leader>fF", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Text" }
      }
}
