require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"elixir",
		"fish",
		"gleam",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"regex",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"yaml",
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
