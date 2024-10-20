local cmp = require('cmp')

cmp.setup {
   snippet = {
      -- 这里我们使用 luasnip 代替 vsnip
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'luasnip', option = { show_autosnippets = true } }, -- 使用 luasnip
   },
}

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   }),
   matching = { disallow_symbol_nonprefix_matching = false }
})

require('luasnip/loaders/from_vscode').lazy_load()
