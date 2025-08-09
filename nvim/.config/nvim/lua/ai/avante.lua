-- Post install, build avante
vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Handle avante updates",
    group = vim.api.nvim_create_augroup("avante-pack-changed-update-handler", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" then
            vim.notify("avante updated, running make...", vim.log.levels.INFO)

            vim.loop.spawn("make", {
                cwd = event.data.path,
            }, function(err)
                if err then
                    vim.notify("Error building(make) avante!", vim.log.levels.ERROR)
                else
                    vim.notify("avante builded successfully", vim.log.levels.INFO)
                end
            end)
        end
    end,
})

vim.pack.add({
    -- avante's dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "https://github.com/zbirenbaum/copilot.lua",
    -- "https://github.com/echasnovski/mini.pick", -- for file_selector provider mini.pick
    "https://github.com/hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "https://github.com/stevearc/dressing.nvim", -- for input provider dressing
    "https://github.com/folke/snacks.nvim", -- for input provider snacks
    "https://github.com/nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "https://github.com/HakonHarnes/img-clip.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",

    { src = "https://github.com/yetone/avante.nvim", version = "v0.0.27" },
})

require("avante").setup({
    provider = "copilot",
})
