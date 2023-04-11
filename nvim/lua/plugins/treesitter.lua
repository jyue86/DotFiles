-- Languages
-- Note for treesitter: Rename the parser file inside
-- the nvim folder bc only one parser can be used at a time
-- Folder: ~/.local/bin/nvim-linux64/lib/nvim/
return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	config = function(_, opts)
		local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
		if not treesitter_status_ok then
			return
		end
		treesitter.setup({
			ensure_installed = {
				"cpp",
				"json",
				"lua",
				"python",
				"svelte",
				"typescript",
			},
			sync_install = false,
			auto_install = true,
			autotag = {
				enable = true,
			},
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "python" },
			},
		})
	end,
}
