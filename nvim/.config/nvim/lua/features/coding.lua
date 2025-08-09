vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "master",
    },
})

require("nvim-treesitter").setup({
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "scss",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "dockerfile",
        "gitignore",
        "java",
    },
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Handle nvim-treesitter updates",
    group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" then
            vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, "TSUpdate")
            if ok then
                vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
            else
                vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
            end
        end
    end,
})
