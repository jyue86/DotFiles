return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>git<cr>", desc = "Open Lazygit" },
	},
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local git_client = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "double",
			},
		})

		function GitClient()
			git_client:toggle()
		end

		local keymap = vim.keymap
		keymap.set("n", "<leader>git<cr>", GitClient)
	end,
}
