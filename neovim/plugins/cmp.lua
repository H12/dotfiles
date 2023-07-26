return {
	'hrsh7th/nvim-cmp',
	lazy = false,
	priority = 220,
	config = function()
		local cmp = require('cmp')

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
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
				{ name = 'vsnip' },
			}, {
				{ name = 'buffer' },
			}),
			view = 'native'
		})
	end,

	lsp = {
		'hrsh7th/cmp-nvim-lsp',
		lazy = false,
		priority = 200,
	},

	buffer = {
		'hrsh7th/cmp-buffer',
		lazy = false,
		priority = 210,
	},

	vsnip = {
		'hrsh7th/cmp-vsnip',
		lazy = false,
		priority = 230,
	},

	vvsnip = {
		'hrsh7th/vim-vsnip',
		lazy = false,
		priority = 240,
	},

	vvsnipi = {
		'hrsh7th/vim-vsnip-integ',
		lazy = false,
		priority = 250,
	},
}
