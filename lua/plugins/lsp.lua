local keymaps = {
  { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",            desc = "Declaration" },
  { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",             desc = "Definition" },
  { "gt",         "<cmd>lua vim.lsp.buf.type_definition()<CR>",        desc = "Type Definition" },
  { "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",                  desc = "Hover" },
  { "gI",         "<cmd>lua vim.lsp.buf.implementation()<CR>",         desc = "Implementation" },
  { "gr",         "<cmd>lua vim.lsp.buf.references()<CR>",             desc = "References" },
  { "gl",         "<cmd>lua vim.diagnostic.open_float()<CR>",          desc = "Open Float" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",   desc = "Lsp Format" },
  { "<leader>li", "<cmd>LspInfo<cr>",                                  desc = "Lsp Info" },
  { "<leader>lI", "<cmd>LspInstallInfo<cr>",                           desc = "Lsp Install Info" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",            desc = "Code Action" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "Goto next" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Goto prev diagnostic" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                 desc = "Rename" },
  { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>",         desc = "Signature Help" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>",          desc = "Set Loc List" }
}

return {
         -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',       opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  keys = keymaps,
  config = function()
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {}

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end,
    }
  end
}
