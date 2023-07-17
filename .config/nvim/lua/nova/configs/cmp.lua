local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	print '[Error] nvim-cmp is not installed!'
	return
end

local luasnip_status_ok, luasnips = pcall(require, 'luasnip')
if not luasnip_status_ok then
	print '[Error] luasnip is not installed!'
	return
end

local cmp_lsp_status_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_status_ok then
	print '[Error] cmp_nvim_lsp is not installed!'
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	print '[Error] lspconfig is not installed!'
	return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnips.lsp_expand(args.body)
    end,
  },

	window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

	mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

  lspconfig['lua_ls'].setup {
    capabilities = capabilities
  }

	lspconfig['clangd'].setup {
		capabilities = capabilities
	}

	lspconfig['rust_analyzer'].setup {
		capabilities = capabilities
	}

	lspconfig['jedi_language_server'].setup {
		capabilities = capabilities
	}

	lspconfig['gopls'].setup {
		capabilities = capabilities
	}

	lspconfig['texlab'].setup {
		capabilities = capabilities
	}

