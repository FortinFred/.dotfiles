vim.pack.add({
    -- cyberdream.nvim colorscheme
    "http://github.com/scottmckendry/cyberdream.nvim",

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
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/akinsho/bufferline.nvim",

    -- LSP
    "https://github.com/neovim/nvim-lspconfig",

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
    "http://github.com/stevearc/conform.nvim",

    -- nvim-lint
    { src = "https://github.com/mfussenegger/nvim-lint", name = "lint" },

    -- blink.cmp and its dependencies
    "https://github.com/giuxtaposition/blink-cmp-copilot",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },

    -- trouble.nvim for diagnostics
    "https://github.com/folke/trouble.nvim",

    -- live-preview.nvim with dependencies for live preview of markdown files
    "https://github.com/folke/snacks.nvim",
    "https://github.com/brianhuster/live-preview.nvim",

    -- copilot.lua for GitHub Copilot integration
    "https://github.com/zbirenbaum/copilot.lua",

    -- mcp-hub and dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/ravitemer/mcphub.nvim",

    -- avante's dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "https://github.com/zbirenbaum/copilot.lua",
    -- "https://github.com/echasnovski/mini.pick", -- for file_selector provider mini.pick
    "https://github.com/hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "https://github.com/stevearc/dressing.nvim", -- for input provider dressing
    "https://github.com/folke/snacks.nvim", -- for input provider snacks
    "https://github.com/nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "https://github.com/HakonHarnes/img-clip.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    { src = "https://github.com/yetone/avante.nvim", version = "v0.0.27" },

    --tmux
    "https://github.com/alexghergh/nvim-tmux-navigation",

    --grug-far
    "https://github.com/MagicDuck/grug-far.nvim",
})
