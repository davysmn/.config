local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'eslint',
  'tsserver',
  'emmet_ls',
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.format_mapping('gq', {
  servers = {
    ['lua_ls'] = { 'lua' },
    ['eslint'] = { 'javascript', 'javascriptreact' },
    ['tsserver'] = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    ['emmet_ls'] = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  }
})

local cmp = require('cmp')
cmp.setup({
  snippet =  {
    expand = function (args)
     require('luasnip').lsp.expand(args.body)
    end
  };

  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = nil,
  });

  sources = cmp.config.sources({
    { name = 'nvim-lsp' },
    { name = 'luasnip' }
  }, {
    { name = 'buffer' },
  })
})

lsp.set_preferences({
  suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
  print('LSP ', client.name, ' attached')
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
