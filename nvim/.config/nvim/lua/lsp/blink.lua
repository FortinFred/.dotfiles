require("blink.cmp").setup({

    keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" }, ["<C><leader>"] = { "show" } },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = { documentation = { auto_show = true } },

    sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
            copilot = {
                name = "copilot",
                module = "blink-cmp-copilot",
                score_offset = 100,
                async = true,
            },
        },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
})
--	    opts_extend = { "sources.default" },
