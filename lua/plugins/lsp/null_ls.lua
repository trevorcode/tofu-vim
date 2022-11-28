local null_ls = require("null-ls")

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

local mrf = h.make_builtin({
  name = "fantomas",
  method = FORMATTING,
  filetypes = { "fs" },
  generator_opts = {
      command = "dotnet fantomas",
      args = {
          "--stdin --stdout",
      },
      to_stdin = true,
  },
  factory = h.formatter_factory,
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        mrf,
    },
})
