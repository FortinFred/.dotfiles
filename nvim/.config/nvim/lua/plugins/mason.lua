return {
    {
        "williamboman/mason.nvim",
        opts = {},
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    ensure_isntalled = {
                        "tsserver",
                        "html",
                        "cssls",
                        "lua_ls",
                        "pyright",
                    },
                },
            },
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                opts = { ensure_installed = { "prettier", "stylua", "isort", "black" } },
            },
        },
    },
}
