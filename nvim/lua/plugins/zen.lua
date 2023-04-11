-- return {
-- 	"folke/zen-mode.nvim",
-- 	cmd = "ZenMode",
-- 	keys = { "<leader>z<cr>", "<cmd>ZenMode<cr>", desc = "ZenMode" },
-- 	config = function()
-- 		require("zen-mode").setup({
-- 			window = { width = 0.85 },
-- 		})
-- 	end,
-- }
return {
	"folke/zen-mode.nvim",
	keys = {
    {"<leader>zm<cr>", "<cmd>ZenMode<cr>", desc = "Open ZenMode" }
  },
	config = function()
		require("zen-mode").setup({
			window = { width = 0.85 },
		})
	end,
}
