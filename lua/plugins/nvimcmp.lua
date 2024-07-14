local cmp = require('cmp')

cmp.setup {
  snippet = {
    -- 这里我们使用 luasnip 代替 vsnip
    expand = function(args)
      require('luasnip').lsp_expand(args)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete,
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' }, -- 使用 luasnip
  },
}

require('luasnip/loaders/from_vscode').lazy_load()
