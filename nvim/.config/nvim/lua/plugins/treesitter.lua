return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    autotag = {
      enable = true,
    },
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
    highlight = {
      enable = true, -- Enable syntax highlighting
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    indent = {
      enable = true, -- Enable indentation based on Treesitter
    },
  },
}

