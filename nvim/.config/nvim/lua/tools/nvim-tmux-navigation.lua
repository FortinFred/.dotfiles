require("nvim-tmux-navigation").setup({
    disable_when_zoomed = true, -- defaults to false
})

vim.keymap.set("n", "<c-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Navigate Left" })
vim.keymap.set("n", "<c-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Navigate Down" })
vim.keymap.set("n", "<c-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Navigate Up" })
vim.keymap.set("n", "<c-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Navigate Right" })
