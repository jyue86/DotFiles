return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		disable_filetype = { "TelescopePrompt", "vim" },
	},
	config = function(_, opts)
		local nap_status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
		if not nap_status_ok then
			return
		end

		nvim_autopairs.setup(opts)
	end,
}
