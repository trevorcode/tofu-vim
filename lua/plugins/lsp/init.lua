local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Error with lspconfig")
  return
end

require "plugins.lsp.lspconfig"
--require "tofu.lsp.null-ls"
