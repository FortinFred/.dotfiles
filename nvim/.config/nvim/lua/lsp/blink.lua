vim.pack.add({
    "https://github.com/giuxtaposition/blink-cmp-copilot",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
})

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
