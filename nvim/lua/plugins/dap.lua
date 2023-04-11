return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				require("dapui").setup()
			end,
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
		},
		{
			"folke/neodev.nvim",
		},
	},
	keys = {
		{ "<leader>dap<cr>", desc = "Open DAP UI" },
		{ "<leader>b<cr>", desc = "Toggle Breakpoint" },
		{ "<leader>B<cr>", desc = "Toggle Conditional Breakpoint" },
		{ "<leader>lp<cr>", desc = "Set Breakpoint With Logs" },
		{ "<leader>dr<cr>", desc = "Open Repl" },
	},
	config = function()
		local mdp = require("mason-nvim-dap")
		local dap, dapui = require("dap"), require("dapui")
		local map = vim.keymap

		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		mdp.setup({
			ensure_installed = { "python" },
			automatic_setup = true,
			handlers = {
				function(config)
					mdp.default_setup(config)
				end,
				python = function(config)
					config.adapters = {
						type = "executable",
						command = "/usr/bin/python3",
						args = {
							"-m",
							"debugpy.adapter",
						},
					}

					mdp.default_setup(config)
				end,
			},
		})

		map.set("n", "<leader>dap<cr>", dapui.toggle)
		map.set("n", "<F2>", "<cmd>lua require'dap'.disconnect(); require'dap'.close();<cr>")
		map.set("n", "<F3>", dap.step_over)
		map.set("n", "<F4>", dap.step_into)
		map.set("n", "<F5>", dap.step_out)
		map.set("n", "<F8>", "<cmd>lua require'dap'.disconnect(); require'dap'.close(); require'dap'.continue()<cr>")
		map.set("n", "<F9>", dap.continue)
		map.set("n", "<leader>b<cr>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
		map.set(
			"n",
			"<leader>B<cr>",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
		)
		map.set(
			"n",
			"<leader>lp<cr>",
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
		)
		map.set("n", "<leader>dr<cr>", "<cmd>lua require'dap'.repl.open()<cr>")
	end,
}

-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
-- "folke/neodev.nvim",
-- "jay-babu/mason-nvim-dap.nvim",
-- "theHamsta/nvim-dap-virtual-text",
-- "jose-elias-alvarez/typescript.nvim",
--
--
-- handlers = {
--   function(source_name)
--     mdp.automatic_setup(source_name)
--     -- require("mason-nvim-dap.automatic_setup")(source_name)
--   end,
--   python = function(source_name)
--     dap.adapters.python = {
--       type = "executable",
--       command = "/usr/bin/python3",
--       args = { "-m", "debugpy.adapter" },
--     }
--
--     dap.configurations.python = {
--       {
--         type = "python",
--         request = "launch",
--         name = "Launch file",
--         program = "${file}",
--       },
--     }
--   end,
-- },
