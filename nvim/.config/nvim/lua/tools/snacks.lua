require("snacks").setup({
    notifier = {},
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        grep = { hidden = true}
      }
    },
    lazygit = {},
})

local wk = require("which-key")
wk.add({ "<leader>s", group = "Search" })

vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader><leader>", function()
    Snacks.picker.smart()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>n", function()
    Snacks.picker.notifications()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>sh", function()
    Snacks.picker.help()
end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>si", function()
    Snacks.picker.icons()
end, { desc = "Icons" })
vim.keymap.set("n", "gd", function()
    Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function()
    Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function()
    Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", function()
    Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function()
    Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
