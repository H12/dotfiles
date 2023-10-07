-- Language server configs
local function config()
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig.configs")

	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	-- EFM Setup
	lspconfig.efm.setup({
		capabilities = capabilities,
		filetypes = { "html", "heex" },
		init_options = { documentFormatting = true },
	})

	-- Lexical config setup
	local lexical_config = {
		filetypes = { "elixir", "eelixir", },
		cmd = { "/Users/henryfirth/code/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
		settings = {
			capabilities = capabilities,
			filetypes = { "elixir", "eelixir", "heex", "html" },
		},
	}

	if not configs.lexical then
		configs.lexical = {
			default_config = {
				filetypes = lexical_config.filetypes,
				cmd = lexical_config.cmd,
				root_dir = function(fname)
					return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
				end,
				-- optional settings
				settings = lexical_config.settings,
			},
		}
	end

	lspconfig.lexical.setup({
		capabilities = capabilities,
		filetypes = { "elixir", "eelixir" },
	})

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		cmd = { "lua-language-server" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim", "hs" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})

	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
	})

	lspconfig.gopls.setup({
		capabilities = capabilities,
	})

	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
	})
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	priority = 300, -- Must come after cmp
	config = config
}
