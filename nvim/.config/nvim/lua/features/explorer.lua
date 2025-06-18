vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
return {

    {
        "echasnovski/mini.files",
        version = false,
        opts = {
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
        },
        keys = {
            {
                "<leader>e",
                function()
                    require("mini.files").open()
                end,
                desc = "Open Explorer",
            },
        },
    },
}
