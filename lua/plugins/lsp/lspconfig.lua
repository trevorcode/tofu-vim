local servers = {
	-- "lua-language-server",
  "html",
  "cssls",
  "fsautocomplete"
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.DEBUG,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- lsp config global settings

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)


-- Diagnostic Customization
--
local signs = {

  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = true,
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

---
-- LSP servers
---
local default_handler = function(server)
  -- See :help lspconfig-setup
  lspconfig[server].setup({})
end

-- See :help mason-lspconfig-dynamic-server-setup
require('mason-lspconfig').setup_handlers({
  default_handler,
  ['tsserver'] = function()
    lspconfig.tsserver.setup({
      settings = {
        completions = {
          completeFunctionCalls = true
        }
      }
    })
  end,
  ['fsautocomplete'] = function()
    lspconfig.fsautocomplete.setup({
        cmd = {
          "fsautocomplete", "--adaptive-lsp-server-enabled", "--verbose"
          --{ "fsautocomplete", "--adaptive-lsp-server-enabled" }
        },
--        filetypes = {
--          "fsharp"
--        },
        init_options = {
          AutomaticWorkspaceInit = true
        },
        settings = {
          FSharp = {
            ResolveNamespaces = true
          }
        }
    })
  end,
})
