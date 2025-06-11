local cmp = require'cmp'

cmp.setup({
  snippet = {},
  window = {},
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'codeium' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'conjure' },
  }),
  formatting = {
    format = require('lspkind').cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = '...',
      symbol_map = { Codeium = "", }
    })
  }
})

