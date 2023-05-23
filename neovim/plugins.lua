require('plugins/telescope')
require('plugins/floaterm')
require('plugins/gitsigns')
require('plugins/colorscheme')
require('plugins/indent_blankline')
require('plugins/lualine')
require('plugins/mason')
require('plugins/nvim-cmp')
require('plugins/startup')
require('plugins/treesitter')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Extra text objects
	use 'kana/vim-textobj-user'
	use 'andyl/vim-textobj-elixir'

	-- TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Language Server Protocol
	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}

	use {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	-- Float-Term
	use 'voldikss/vim-floaterm'

	-- Telescope and deps
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }
	use { 'nvim-telescope/telescope-ui-select.nvim' }

	-- Landing page
	use {
		'startup-nvim/startup.nvim',
		requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
	}

	-- Statusline
	use 'itchyny/vim-gitbranch'
	use {
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Tab highlighting
	use 'lukas-reineke/indent-blankline.nvim'

	-- Completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- Snippets
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'

	-- Git signs
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
	}

	-- Tpope goodness
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-repeat'
	use 'tpope/vim-surround'

	-- Tmux stuffs
	use 'christoomey/vim-tmux-navigator'

	-- Copilot
	use 'github/copilot.vim'

	-- THEMES --

	-- Catppuccin
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Dracula
	use 'Mofiqul/dracula.nvim'

	-- Everforest
	use 'sainnhe/everforest'

	-- Gruvbox Baby
	use 'luisiacc/gruvbox-baby'

	-- Gruvbox Material
	use 'sainnhe/gruvbox-material'

	-- Github Theme
	use 'projekt0n/github-nvim-theme'

	-- Nord
	use 'shaunsingh/nord.nvim'

	-- Solarized
	use 'ishan9299/nvim-solarized-lua'

	-- Tokyo Night
	use 'folke/tokyonight.nvim'
end)
