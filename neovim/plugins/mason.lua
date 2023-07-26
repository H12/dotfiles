return {
	"williamboman/mason.nvim",
	lazy = false,
	priority = 50,
	config = true,
	lspconfig = {
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		priority = 100,
		config = true,
	}
}
