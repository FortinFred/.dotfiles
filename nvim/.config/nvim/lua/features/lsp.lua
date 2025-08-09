vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "prettier",
        "prettierd",
        "isort",
        "black",
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
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

-- return {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--         { "mason-org/mason.nvim", opts = {} },
--         "mason-org/mason-lspconfig.nvim",
--         "WhoIsSethDaniel/mason-tool-installer.nvim",
--
--         -- Useful status updates for LSP.
--         { "j-hui/fidget.nvim", opts = {} },
--
--         -- Allows extra capabilities provided by blink.cmp
--         "saghen/blink.cmp",
--         {
--             "folke/lazydev.nvim",
--             ft = "lua", -- only load on lua files
--             opts = {
--                 library = {
--                     -- See the configuration section for more details
--                     -- Load luvit types when the `vim.uv` word is found
--                     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
--                 },
--             },
--         },
--     },
--     config = function()
--         vim.api.nvim_create_autocmd("LspAttach", {
--             group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
--             callback = function(event)
--                 local map = function(keys, func, desc, mode)
--                     mode = mode or "n"
--                     vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
--                 end
--
--                 require("which-key").add({ { "<leader>c", group = "[C]ode" } })
--
--                 map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
--                 map("<leader>ca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
--                 map("gr", function()
--                     require("fzf-lua").lsp_references()
--                 end, "[G]oto [R]eferences")
--             end,
--         })
--
--         -- Diagnostic Config
--         -- See :help vim.diagnostic.Opts
--         vim.diagnostic.config({
--             severity_sort = true,
--             float = { border = "rounded", source = "if_many" },
--             underline = { severity = vim.diagnostic.severity.ERROR },
--             signs = vim.g.have_nerd_font and {
--                 text = {
--                     [vim.diagnostic.severity.ERROR] = "󰅚 ",
--                     [vim.diagnostic.severity.WARN] = "󰀪 ",
--                     [vim.diagnostic.severity.INFO] = "󰋽 ",
--                     [vim.diagnostic.severity.HINT] = "󰌶 ",
--                 },
--             } or {},
--             virtual_text = {
--                 source = "if_many",
--                 spacing = 2,
--                 format = function(diagnostic)
--                     local diagnostic_message = {
--                         [vim.diagnostic.severity.ERROR] = diagnostic.message,
--                         [vim.diagnostic.severity.WARN] = diagnostic.message,
--                         [vim.diagnostic.severity.INFO] = diagnostic.message,
--                         [vim.diagnostic.severity.HINT] = diagnostic.message,
--                     }
--                     return diagnostic_message[diagnostic.severity]
--                 end,
--             },
--         })
--
--         local capabilities = require("blink.cmp").get_lsp_capabilities()
--
--         -- Enable the following language servers
--         --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--         --
--         --  Add any additional override configuration in the following tables. Available keys are:
--         --  - cmd (table): Override the default command used to start the server
--         --  - filetypes (table): Override the default list of associated filetypes for the server
--         --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--         --  - settings (table): Override the default settings passed when initializing the server.
--         --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
--         local servers = {
--             angularls = {},
--             ts_ls = {},
--             lua_ls = {
--                 settings = {
--                     Lua = {
--                         completion = {
--                             callSnippet = "Replace",
--                         },
--                     },
--                 },
--             },
--         }
--
--         local ensure_installed = vim.tbl_keys(servers or {})
--         vim.list_extend(ensure_installed, {
--             "stylua", -- Used to format Lua code
--         })
--         require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
--
--         require("mason-lspconfig").setup({
--             ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
--             automatic_installation = false,
--             handlers = {
--                 function(server_name)
--                     local server = servers[server_name] or {}
--                     -- This handles overriding only values explicitly passed
--                     -- by the server configuration above. Useful when disabling
--                     -- certain features of an LSP (for example, turning off formatting for ts_ls)
--                     server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
--                     require("lspconfig")[server_name].setup(server)
--                 end,
--             },
--         })
--     end,
-- }
