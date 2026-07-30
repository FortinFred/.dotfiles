require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false,
    },
    panel = {
        enabled = false,
    },
    filetypes = {
        markdown = true,
        help = true,
        html = true,
        javascript = true,
        typescript = true,
        ["*"] = true,
    },
})
