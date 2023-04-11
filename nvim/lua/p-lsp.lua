-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local LUA_SERVER = "lua"
local PYTHON_SERVER = "python"
local TS_SERVER = "ts"

local on_attach = function(client, bufnr, serverType)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<space>k", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	-- format on save
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
		buffer = bufnr,
		callback = function()
			if serverType == TS_SERVER then
				require("typescript").actions.removeUnused({ sync = true })
				--[[ vim.keymap.set('n', '<leader>o', '<cmd>TypescriptOrganizeImports<cr>')
        vim.keymap.set('n', '<leader>o', '<cmd>TypescriptAddMissingImports<cr>') ]]
			end
			vim.lsp.buf.format()
		end,
	})
end

-- Set up lsconfig (for cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_config = {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(_, bufnr, nil)
	end,
}

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup(lsp_config)
	end,
	lua_ls = function()
		require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_config, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}))
	end,
	tsserver = function()
		-- require("typescript").setup({
		--   server = vim.tbl_extend("force", lsp_config, {
		--     on_attach = function(_, bufnr)
		--       on_attach(_, bufnr, TS_SERVER)
		--     end,
		--     init_options = {
		--       preferences = {
		--         importModuleSpecifierPreference = "project=absolute",
		--         jsxAttributeCompletionStylr = "none",
		--       },
		--     },
		--   }),
		-- })
	end,
	function()
		require("pyright").setup({
			server = vim.tbl_extend("force", lsp_config, {
				on_attach = function(_, bufnr)
					on_attach(_, bufnr, PYTHON_SERVER)
				end,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			}),
		})
	end,
	function()
		require("clangd").setup({})
	end,
	function()
		require("rust-analyzer").setup({})
	end,
})
