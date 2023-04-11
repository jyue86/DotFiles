local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"cmake",
		"clangd",
		"dockerls",
		"docker_compose_language_service",
		"html",
		"jsonls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"svelte",
		"tailwindcss",
		"tsserver",
		"yamlls",
	},
	automatic_installation = true,
})
