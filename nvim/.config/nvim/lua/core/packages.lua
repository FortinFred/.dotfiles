vim.pack.add({
    -- cyberdream.nvim colorscheme
    "https://github.com/scottmckendry/cyberdream.nvim",

    -- which-key.nvim for keymap hints
    "https://github.com/folke/which-key.nvim",

    -- noice.nvim for enhanced UI
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/folke/noice.nvim",

    -- lualine.nvim for statusline
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",

    -- bufferline.nvim for buffer/tab line
    "https://github.com/akinsho/bufferline.nvim",

    -- LSP
    "https://github.com/neovim/nvim-lspconfig",

    -- DAP
    "https://github.com/mfussenegger/nvim-dap",

    -- nvim-lint
    { src = "https://github.com/mfussenegger/nvim-lint", name = "lint" },

    -- mason 
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/jay-babu/mason-nvim-dap.nvim",
    "https://github.com/rshkarin/mason-nvim-lint",

    -- mini.nvim for multiple utilities
    "https://github.com/echasnovski/mini.nvim",

    -- snacks.nvim for various utilities including lazygit
    "https://github.com/folke/snacks.nvim",

    -- gitsigns
    "https://github.com/lewis6991/gitsigns.nvim",

    -- flash
    "https://github.com/folke/flash.nvim",

    -- nvim-treesitter
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "master",
    },

    -- conform.nvim for formatting and linting
    "https://github.com/stevearc/conform.nvim",


    -- blink.cmp and its dependencies
    "https://github.com/giuxtaposition/blink-cmp-copilot",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },

    -- trouble.nvim for diagnostics
    "https://github.com/folke/trouble.nvim",

    -- live-preview.nvim with dependencies for live preview of markdown files
    "https://github.com/brianhuster/live-preview.nvim",

    -- copilot.lua for GitHub Copilot integration
    "https://github.com/zbirenbaum/copilot.lua",

    -- sidekick.nvim for NES + AI CLI terminal (herdr branch)
    { src = "https://github.com/rmarganti/sidekick.nvim", version = "herdr"},

    -- herdr navigation + resizing
    "https://github.com/lmilojevicc/herdr-splits.nvim",

    --grug-far
    "https://github.com/MagicDuck/grug-far.nvim",

    --rust
    "https://github.com/mrcjkb/rustaceanvim"
})
