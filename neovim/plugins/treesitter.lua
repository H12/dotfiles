return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"css",
				"elixir",
				"heex",
				"html",
				"javascript",
				"lua",
				"rust",
				"sql",
			},
			ignore_install = {},
			sync_install = false,
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			modules = {},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",
						["aa"] = "@attribute.outer",
						["ia"] = "@attribute.inner",
					},
				},
			}
		})
	end,
	textobjects = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	}
}
