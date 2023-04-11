return {
	"numToStr/Comment.nvim",
	event = "BufReadPre",
	config = function()
		require("Comment").setup()
	end,
}
