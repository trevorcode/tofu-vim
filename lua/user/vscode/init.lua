local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Exit insert mode
keymap("i", "jk", "<esc>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<leader>er", "<Cmd>call VSCodeNotify('calva.evaluateCurrentTopLevelForm')<CR>", opts)
keymap("n", "<leader>ee", "<Cmd>call VSCodeNotify('calva.evaluateSelection')<CR>", opts)
keymap("n", "<leader>e!", "<Cmd>call VSCodeNotify('calva.evaluateSelectionReplace')<CR>", opts)
keymap("n", "<leader>eb", "<Cmd>call VSCodeNotify('calva.evaluateStartOfFileToCursor')<CR>", opts)
keymap("n", "<leader>ecr", "<Cmd>call VSCodeNotify('calva.evaluateTopLevelFormAsComment')<CR>", opts)
keymap("n", "<leader>ece", "<Cmd>call VSCodeNotify('calva.evaluateSelectionAsComment')<CR>", opts)

keymap("n", ">)", "<Cmd>call VSCodeNotify('paredit.slurpSexpForward')<CR>", opts)
keymap("n", "<)", "<Cmd>call VSCodeNotify('paredit.barfSexpForward')<CR>", opts)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("vscodeplugins")


