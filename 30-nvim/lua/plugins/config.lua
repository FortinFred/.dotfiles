return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_a, 1, function()
        return ""
      end)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        angularjs = function(_, opts)
          require("lspconfig.util").root_pattern("angular.json", "nx.json")
          return require("lspconfig").angularls.setup({ { server = opts } })
        end,
      },
    },
  },
  {
    "tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
