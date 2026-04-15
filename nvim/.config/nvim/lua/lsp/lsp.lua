vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")
vim.lsp.enable("gh_actions")

vim.lsp.enable("angularls")
vim.lsp.enable("eslint")
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("bashls")

vim.pack.add({ "https://github.com/folke/lazydev.nvim" })

require("lazydev").setup({
    library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    } or {},
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("fred-neovim-lsp-attach", { clear = true }),
    callback = function()
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Goto Code Action" })
    end,
})
