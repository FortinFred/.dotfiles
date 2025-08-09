vim.g.have_nerd_font = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.o.winborder = "rounded"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.shiftwidth = 4

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})
