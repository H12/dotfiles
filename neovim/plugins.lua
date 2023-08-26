-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Source individual plugin configs
require("lazy").setup({
	require("plugins/lspconfig"),
	require("plugins/mason"),
	require("plugins/mason").lspconfig,
	require("plugins/treesitter"),
	require("plugins/treesitter").textobjects,
	require("plugins/tokyonight"),
	require("plugins/telescope"),
	require("plugins/telescope").file_browser,
	require("plugins/gitsigns"),
	require("plugins/indent-blankline"),
	require("plugins/cmp"),
	require("plugins/cmp").lsp,
	require("plugins/cmp").buffer,
	require("plugins/cmp").vsnip,
	require("plugins/cmp").vvsnip,
	require("plugins/cmp").vvsnipi,
	require("plugins/startup"),
	require("plugins/lualine"),

	"folke/twilight.nvim",

	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-commentary",

	"github/copilot.vim",

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-neorg/neorg-telescope" },
		},
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
					["core.integrations.telescope"] = {}, -- Enables the Telescope module
				},
			}
		end,
	},
})

-- Sticking neorg keybinds here for now
local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-l>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
