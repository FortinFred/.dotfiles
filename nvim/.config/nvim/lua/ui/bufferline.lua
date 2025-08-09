vim.pack.add({
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
    },
})
