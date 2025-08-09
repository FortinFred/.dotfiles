vim.pack.add({ "http://github.com/scottmckendry/cyberdream.nvim" })

require("cyberdream").setup({
    italic_comments = true,
})
vim.cmd("colorscheme cyberdream")
