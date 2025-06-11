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
      servers = {
        angularls = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("angular.json", "nx.json")(fname) or util.find_git_ancestor(fname)
          end,
        },
      },
    },
  },
}
