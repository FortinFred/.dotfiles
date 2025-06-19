return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional for icons
    },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({}) -- Add your custom configuration here if needed

        -- Key mappings for file search and content search
        vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Find in Files" })
        vim.keymap.set("n", "<leader>ge", fzf.git_status, { desc = "Git Status Files" })
        -- Key mappings for Neovim help topics
        vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Search Help Topics" })
    end,
}
