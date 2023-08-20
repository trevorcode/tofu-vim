return {
  dir = "~/source/fennel/sandbox/scratch",
  keys = {
    { "<leader>dr", "<cmd>DiceRoller<cr>", desc = "DiceRoller" },
  },
  config = function()
    require('dnd').setup {}
  end,
}
