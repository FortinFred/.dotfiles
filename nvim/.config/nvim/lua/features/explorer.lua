vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
    "https://github.com/echasnovski/mini.files",
})

require("mini.files").setup({
    mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "<ENTER>",
        go_out = "h",
        go_out_plus = "H",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
    },
    windows = {
        preview = true,
        width_preview = 80,
    },
    actions = {
        open = "new_buffer", -- open files in a new buffer if not already opened
    },
})

vim.keymap.set("n", "<leader>e", function()
    MiniFiles.open()
end, { desc = "Open Explorer" })
