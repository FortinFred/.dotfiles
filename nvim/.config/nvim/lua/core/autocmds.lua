vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Handle post package install tasks",
    group = vim.api.nvim_create_augroup("fred-neovim-pack-changed", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" then
            -- nvim-treesitter
            if event.data.spec.name == "nvim-treesitter" then
                vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
                ---@diagnostic disable-next-line: param-type-mismatch
                local ok = pcall(vim.cmd, "TSUpdate")
                if ok then
                    vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
                else
                    vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.ERROR)
                end
            end

        end
    end,
})
