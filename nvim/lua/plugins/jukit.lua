local g = vim.g
g.jukit_hist_use_ueberzug = 1

return {
  "luk400/vim-jukit",
	event = "BufReadPre",
}
