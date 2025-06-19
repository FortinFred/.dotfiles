return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        keys = { { "<leader>n", "<CMD>Noice fzf<CR>" } },
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },

    -- {
    --     "snacks.nvim",
    --     opts = {
    --         indent = { enabled = true },
    --         input = { enabled = true },
    --         notifier = { enabled = true },
    --         scope = { enabled = true },
    --         scroll = { enabled = true },
    --         statuscolumn = { enabled = false }, -- we set this in options.lua
    --         words = { enabled = true },
    --     },
    --     keys = {
    --         {
    --             "<leader>n",
    --             function()
    --                 if Snacks.config.picker and Snacks.config.picker.enabled then
    --                     Snacks.picker.notifications()
    --                 else
    --                     Snacks.notifier.show_history()
    --                 end
    --             end,
    --             desc = "Notification History",
    --         },
    --         {
    --             "<leader>un",
    --             function()
    --                 Snacks.notifier.hide()
    --             end,
    --             desc = "Dismiss All Notifications",
    --         },
    --     },
    -- },
}
