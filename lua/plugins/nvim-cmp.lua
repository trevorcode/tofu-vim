-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet


-- local cmpoptions =
--   {
--         completion = {
--           completeopt = "menu,menuone,noinsert",
--         },
--         snippet = {
--           expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--           end,
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--           ["<S-CR>"] = cmp.mapping.confirm({
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--           }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "luasnip" },
--           { name = "buffer" },
--           { name = "path" },
--         }),
--         formatting = {
--           format = function(_, item)
--             local icons = require("lazyvim.config").icons.kinds
--             if icons[item.kind] then
--               item.kind = icons[item.kind] .. item.kind
--             end
--             return item
--           end,
--         },
--         experimental = {
--           ghost_text = {
--             hl_group = "LspCodeLens",
--           },
--         },
--       }
--
-- local tempOptions = {
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body) -- For `luasnip` users.
--           end,
--         },
--         mapping = {
--           ["<Up>"] = cmp.mapping.select_prev_item(),
--           ["<Down>"] = cmp.mapping.select_next_item(),
--           ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--           ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--           ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--           ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--           ["<C-e>"] = cmp.mapping {
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close(),
--           },
--           -- Accept currently selected item. If none selected, `select` first item.
--           -- Set `select` to `false` to only confirm explicitly selected items.
--           ["<CR>"] = cmp.mapping.confirm { select = true },
--           ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expandable() then
--               luasnip.expand()
--             elseif luasnip.expand_or_jumpable() then
--               luasnip.expand_or_jump()
--             elseif check_backspace() then
--               fallback()
--             else
--               fallback()
--             end
--           end, {
--             "i",
--             "s",
--           }),
--           ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, {
--             "i",
--             "s",
--           }),
--         },
--         formatting = {
--           fields = { "kind", "abbr", "menu" },
--           format = function(entry, vim_item)
--             -- Kind icons
--             vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--             -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--             vim_item.menu = ({
--               nvim_lsp = "[LSP]",
--               luasnip = "[Snippet]",
--               buffer = "[Buffer]",
--               path = "[Path]",
--             })[entry.source.name]
--             return vim_item
--           end,
--         },
--         sources = {
--           { name = "path" },
--           { name = "nvim_lsp" },
--           { name = "buffer" },
--           { name = "luasnip" },
--         },
--         confirm_opts = {
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = false,
--         },
--         window = {
--           documentation = cmp.config.window.bordered(),
--         },
--         experimental = {
--           ghost_text = false,
--           native_menu = false,
--         }
--       }


return {
         -- Autocompletion
  'hrsh7th/nvim-cmp',
  version = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    'L3MON4D3/LuaSnip'
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    luasnip.config.setup {}

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),   -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),   -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      },
    }
  end
}
