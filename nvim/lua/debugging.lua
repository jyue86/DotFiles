local dap, dapui = require("dap"), require("dapui")
dapui.setup()
require("nvim-dap-virtual-text").setup()

local mdp_status_ok, mdp = pcall(require, "mason-nvim-dap")
if not mdp_status_ok then
	return
end
mdp.setup({
	ensure_installed = { "python" },
	automatic_setup = true,
})

require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
	handlers = {
		function(source_name)
			mdp.automatic_setup(source_name)
			-- require("mason-nvim-dap.automatic_setup")(source_name)
		end,
		python = function(source_name)
			dap.adapters.python = {
				type = "executable",
				command = "/usr/bin/python3",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
				},
			}
		end,
	},
})

local map = vim.keymap
map.set("n", "<leader>dap<cr>", dapui.toggle)
map.set("n", "<F2>", "<cmd>lua require'dap'.disconnect(); require'dap'.close();<cr>")
map.set("n", "<F3>", dap.step_over)
map.set("n", "<F4>", dap.step_into)
map.set("n", "<F5>", dap.step_out)
map.set("n", "<F8>", "<cmd>lua require'dap'.disconnect(); require'dap'.close(); require'dap'.continue()<cr>")
map.set("n", "<F9>", dap.continue)
map.set("n", "<leader>b<cr>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
map.set("n", "<leader>B<cr>", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
map.set(
	"n",
	"<leader>lp<cr>",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
)
map.set("n", "<leader>dr<cr>", "<cmd>lua require'dap'.repl.open()<cr>")
-- https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
-- https://stackoverflow.com/questions/75485718/how-do-i-run-a-single-python-test-with-nvim-dap
