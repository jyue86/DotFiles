return {
	"alexghergh/nvim-tmux-navigation",
  keys = {
    { "<c-h>", desc = "TmuxNavLeft" },
    { "<c-j>", desc = "TmuxNavDown" },
    { "<c-k>", desc = "TmuxNavUp" },
    { "<c-l>", desc = "TmuxNavRight" },
    { "<c-\\>", desc = "TmuxNavLastActive" },
    { "<c-space>", desc = "TmuxNavNext" },
  },
  config = function (_, opts)
    local tmux_nav_status_ok, tmux_nav = pcall(require, "nvim-tmux-navigation")
    if not tmux_nav_status_ok then
      return
    end
    tmux_nav.setup({
      disable_when_zoomed = true, -- defaults to false
    })
    vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { noremap = true, silent = true })
  end
}
