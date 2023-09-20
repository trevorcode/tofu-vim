return {
  dir = "~/repos/fennel/gm-tools/",
  keys = {
    { "<leader>dr", "<cmd>DiceRoller<cr>", desc = "DiceRoller" },
    { "<leader>di", "<cmd>DNDOpenInitiative<cr>", desc = "Open Initiative" },
  },
  config = function()
    require('dnd').setup {}
  end,
}
