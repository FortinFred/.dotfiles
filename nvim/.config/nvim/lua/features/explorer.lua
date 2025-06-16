vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
return {

    {
        "echasnovski/mini.files",
        version = false,
        opts = {
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
