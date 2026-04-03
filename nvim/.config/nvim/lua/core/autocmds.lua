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
                vim.uv.spawn("make", {
                    args = {},
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
                vim.uv.spawn("npm", {
                    args = { "install", "-g", "mcp-hub@latest" },
                }, function(exitcode)
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

-- Automatically fix TypeScript imports on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("ts_fix_imports", { clear = true }),
  desc = "Add missing imports and remove unused imports for TS",
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {
      only = { "source.addMissingImports.ts", "source.removeUnused.ts" },
    }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.kind == "source.addMissingImports.ts" then
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.addMissingImports.ts" },
            },
          })
          vim.cmd("write")
        else
          if r.kind == "source.removeUnused.ts" then
            vim.lsp.buf.code_action({
              apply = true,
              context = {
                only = { "source.removeUnused.ts" },
              },
            })
            vim.cmd("write")
          end
        end
      end
    end
  end,
})
