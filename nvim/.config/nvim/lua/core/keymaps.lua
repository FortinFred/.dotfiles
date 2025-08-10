vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load which-key for keymap tips
vim.pack.add({ "https://github.com/folke/which-key.nvim" })
local wk = require("which-key")
wk.setup({ preset = "helix" })

wk.add({ { "<leader>q", group = "Quit" } })
vim.keymap.set("n", "<leader>qq", "<CMD>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>qr", "<CMD>restart<CR>", { desc = "Restart" })

-- save and return to normal mode
vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC><CMD>w<CR>", { desc = "Save File and Exit Insert Mode" })

-- window management
wk.add({ { "<leader>w", group = "Windows" } })
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Close Current Window" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to Bottom Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to Top Window" })

-- buffer management
wk.add({ { "<leader>b", group = "Buffers" } })
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Delete Current Buffer" })
vim.keymap.set("n", "<S-h>", "<CMD>bp<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<CMD>bn<CR>", { desc = "Next Buffer" })
-- delete all buffers
vim.keymap.set("n", "<leader>ba", function()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end, { desc = "Delete All Buffers" })

-- package management
wk.add({ { "<leader>p", group = "Packs" } })
vim.keymap.set("n", "<leader>pc", function()
    vim.pack.update()
end, { desc = "Check Packages" })
vim.keymap.set("n", "<leader>pu", function()
    vim.pack.update({}, { force = true })
end, { desc = "Update Packages" })
