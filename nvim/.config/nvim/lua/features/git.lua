local add = require("which-key").add
add({ { "<leader>h", group = "hunk" } })
add({ { "<leader>g", group = "git" } })
return {
    {
        "folke/snacks.nvim",
        opts = {
            lazygit = {},
        },
        keys = {
            {
                "<leader>gg",
                function()
                    require("snacks").lazygit()
                end,
                desc = "Open Lazygit",
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 0,
            },
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "Next hunk" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "Previous hunk" })

                -- Actions
                map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage/Unstage hunk" })
                map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })

                map("v", "<leader>hs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Toggle hunk" })

                map("v", "<leader>hr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Reset hunk" })

                map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage/Unstage buffer" })
                map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
                map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
                map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

                map("n", "<leader>hb", function()
                    gitsigns.blame_line({ full = true })
                end, { desc = "Blame line" })

                map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff" })

                map("n", "<leader>hD", function()
                    gitsigns.diffthis("~")
                end)

                map("n", "<leader>hQ", function()
                    gitsigns.setqflist("all")
                end)
                map("n", "<leader>hq", gitsigns.setqflist)

                -- Toggles
                map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
                map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

                -- Blame
                map("n", "<leader>gb", gitsigns.blame, { desc = "Git blame buffer" })

                -- Text object
                map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
            end,
        },
    },
}
