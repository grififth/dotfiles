-- Setup nvim-cmp.
local cmp = require'cmp'

local lspkind = require "lspkind"
lspkind.init()

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
  end,
},
mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end,
["<S-Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end,
},
sources = {
    -- { name = "nvim_lua" },
    -- { name = "cmp_tabnine" },
    { name = "nvim_lsp", max_item_count = 10},
    { name = "path" },
    { name = "vsnip" },
    { name = "buffer", keyword_length = 3 },
},
formatting = {
  -- Youtube: How to set up nice formatting for your sources.
  format = lspkind.cmp_format {
    with_text = true,
    menu = {
      buffer = "[buf]",
      nvim_lsp = "[LSP]",
      -- nvim_lua = "[api]",
      path = "[path]",
      vsnip = "[snip]",
      -- cmp_tabnine = "[TN]",
      },
    },
  },
  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = true,
  },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig.
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local servers = {'clangd', 'pyright'}
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        capabilities = capabilities
    }
end
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
