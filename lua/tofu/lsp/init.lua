local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "tofu.lsp.mason"
require("tofu.lsp.handlers").setup()
require "tofu.lsp.null-ls"
