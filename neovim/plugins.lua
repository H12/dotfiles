return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Gruvbox baby
	use 'gruvbox-community/gruvbox'

	-- Syntax highlighting
	use 'elixir-editors/vim-elixir'
	use 'pangloss/vim-javascript'
	use 'MaxMEllon/vim-jsx-pretty'
	use 'ElmCast/elm-vim'

	-- Telescope and deps
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	-- Ranger
	use 'francoiscabrol/ranger.vim'
	use 'rbgrouleff/bclose.vim'

	-- Language Server Protocol
	-- See lsp.lua for server-specific config
	use 'neovim/nvim-lspconfig'

	-- Autocompletion
	use 'hrsh7th/nvim-compe'

	-- Tpope goodness
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-repeat'
	use 'tpope/vim-surround'

	-- Speedy Stylish GitGutter
	use 'airblade/vim-gitgutter'
end)
