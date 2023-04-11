local keymap = vim.keymap

keymap.set("n", "<leader>q", "<cmd>q<cr>")
keymap.set("n", "<leader>w", "<cmd>w<cr>")
keymap.set("n", "<c-a>", "gg<S-v>G")
keymap.set("n", "<leader>s", ":vsplit<Return><C-w>w", { silent = true })
keymap.set("n", "f", "^")
keymap.set("n", "H", "$")

-- Buffers
keymap.set("n", "<s-w>", "<cmd>nohlsearch|diffupdate|normal! <c-l><cr>")
keymap.set("n", "<s-q>", "<cmd>bprevious<cr>")
keymap.set("n", "<s-e>", "<cmd>bnext<cr>")
keymap.set("n", "<leader>bd", "<cmd>bd<cr>")
