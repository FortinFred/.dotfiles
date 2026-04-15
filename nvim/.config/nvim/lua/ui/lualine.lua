require("lualine").setup({
    options = {
        theme = "auto",
        section_separators = { left = "", right = "" },
        globalstatus = true,
    },
    sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { 
          { require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
          }, "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
