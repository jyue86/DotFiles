local opt = vim.opt

opt.relativenumber = true
opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.mouse = "a"
opt.clipboard:append("unnamedplus")

local TAB_WIDTH = 2
opt.tabstop = TAB_WIDTH
opt.softtabstop = TAB_WIDTH
opt.shiftwidth = TAB_WIDTH
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = "yes"
opt.list = true

opt.cursorline = true
opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end
