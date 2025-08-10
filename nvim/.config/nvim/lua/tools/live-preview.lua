vim.pack.add({
    "https://github.com/folke/snacks.nvim",
    "https://github.com/brianhuster/live-preview.nvim",
})

vim.keymap.set("n", "<leader>cp", "<CMD>LivePreview start<CR>", { desc = "Live Preview" })
