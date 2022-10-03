require('plugins/coq_nvim')
require('plugins/floaterm')
require('plugins/gitsigns')
require('plugins/colorscheme')
require('plugins/indent_blankline')
require('plugins/lualine')
require('plugins/telescope')

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Syntax highlighting
	use 'sheerun/vim-polyglot'
	use 'elixir-editors/vim-elixir'
	use 'gleam-lang/gleam.vim'

	-- TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

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

	-- Float-Term
	use 'voldikss/vim-floaterm'

	-- Telescope and deps
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Statusline
	use 'itchyny/vim-gitbranch'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Breadcrumbs for statusline
	use {
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter"
	}

	-- Tab highlighting
	use "lukas-reineke/indent-blankline.nvim"

	-- Language Server Protocol
	-- See lsp.lua for server-specific config
	use 'neovim/nvim-lspconfig'

	-- Autocompletion
	use 'ms-jpq/coq-nvim'
	use 'ms-jpq/coq.artifacts'
	use { 'ms-jpq/coq.thirdparty', branch = '3p' }

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
end)
