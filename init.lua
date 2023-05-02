local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

if vim.g.vscode then
  -- VSCode extension
  load('user.vscode')
else
  -- ordinary Neovim
  load('user.options')
  load('user.keymaps')
  load('user.plugins')
end
