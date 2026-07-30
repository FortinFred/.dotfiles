require("sidekick").setup({
    cli = {
        mux = {
            backend = "herdr",
            enabled = true,
        },
    },
})

vim.lsp.enable("copilot")

vim.keymap.set("n", "<Tab>", function()
    if not require("sidekick").nes_jump_or_apply() then
        return "<Tab>"
    end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

vim.keymap.set("i", "<Tab>", function()
    if require("sidekick").nes_jump_or_apply() then
        return
    end
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    end
end, {
    silent = true,
})

local cli = require("sidekick.cli")
vim.keymap.set({ "n", "x" }, "<leader>at", function() cli.send({ msg = "{this}", submit = true }) end, { desc = "Send This to CLI" })
vim.keymap.set("n", "<leader>af", function()
    local text = vim.fn.input("Prompt: ")
    if text ~= "" then cli.send({ msg = text .. "\n{file}", submit = true })
end end, { desc = "Send File to CLI" })
vim.keymap.set("x", "<leader>av", function()
    local text = vim.fn.input("Prompt: ")
    if text ~= "" then cli.send({ msg = text .. "\n{selection}", submit = true })
end end, { desc = "Send Visual Selection to CLI" })
vim.keymap.set({ "n", "x" }, "<leader>ap", function() cli.prompt() end, { desc = "Select Prompt" })
