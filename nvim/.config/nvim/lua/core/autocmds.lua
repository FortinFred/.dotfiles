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

            -- avante
            if event.data.spec.name == "avante.nvim" then
                vim.notify("avante updated, running make...", vim.log.levels.INFO)
                vim.loop.spawn("make", {
                    cwd = event.data.path,
                }, function(exitcode)
                    if exitcode == 0 then
                        vim.notify("avante built successfully!", vim.log.levels.INFO)
                    else
                        vim.notify("Error building(make) avante!", vim.log.levels.ERROR)
                    end
                end)
                return
            end

            if event.data.spec.name == "mcphub.nvim" then
                vim.notify("mcp-hub updated, running make...", vim.log.levels.INFO)
                vim.loop.spawn("npm install -g mcp-hub@latest", {}, function(exitcode)
                    if exitcode == 0 then
                        vim.notify("mcp-hub installed successfully!", vim.log.levels.INFO)
                    else
                        vim.notify("Error installing mcp-hub!", vim.log.levels.ERROR)
                    end
                end)
            end
        end
    end,
})
