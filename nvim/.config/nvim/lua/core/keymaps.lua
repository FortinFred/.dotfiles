vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load which-key for keymap tips
local wk = require("which-key")
wk.setup({ preset = "helix" })

-- Global groups
wk.add({ { "<leader>c", group = "Code" } })

wk.add({ { "<leader>q", group = "Quit" } })
vim.keymap.set("n", "<leader>qq", "<CMD>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>qr", "<CMD>restart<CR>", { desc = "Restart" })

-- save and return to normal mode
vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC><CMD>w<CR>", { desc = "Save File and Exit Insert Mode" })

-- window management
wk.add({ { "<leader>w", group = "Windows" } })
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Close Current Window" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to Bottom Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to Top Window" })

-- buffer management
wk.add({ { "<leader>b", group = "Buffers" } })

local function delete_buffers(filter)
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
        if filter(buf) and vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end

-- delete other buffers
vim.keymap.set("n", "<leader>bo", function()
    local current_buf = vim.api.nvim_get_current_buf()
    delete_buffers(function(buf)
        return buf ~= current_buf
    end)
end, { desc = "Delete Other Buffers" })

-- delete all buffers
vim.keymap.set("n", "<leader>ba", function()
    delete_buffers(function(buf)
        return true
    end)
end, { desc = "Delete All Buffers" })

vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Delete Current Buffer" })
vim.keymap.set("n", "<S-h>", "<CMD>bp<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<CMD>bn<CR>", { desc = "Next Buffer" })

-- Display full path of current buffer
vim.keymap.set("n", "<leader>fp", function()
  print(vim.api.nvim_buf_get_name(0))
end, { desc = "Show Full Path of Current Buffer" })

-- Search
wk.add({ { "<leader>s", group = "Search" } })

-- package management
wk.add({ { "<leader>p", group = "Packs" } })
vim.keymap.set("n", "<leader>pc", function()
    vim.pack.update()
end, { desc = "Check Packages" })
vim.keymap.set("n", "<leader>pu", function()
    vim.pack.update({}, { force = true })
end, { desc = "Update Packages" })

-- Replace
vim.keymap.set("n", "<leader>sr", function()
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
      transient = true,
      prefills = {
        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      },
    })
end, { desc = "Search and Replace" })


-- pi-nvim (pi coding agent)
wk.add({ { "<leader>ai", group = "pi" } })
vim.keymap.set("n", "<leader>ai", ":Pi<CR>",                          { desc = "Send to pi" })
vim.keymap.set("v", "<leader>ai", ":Pi<CR>",                          { desc = "Send selection to pi" })
vim.keymap.set("n", "<leader>aip", ":PiSend<CR>",                      { desc = "Prompt pi" })
vim.keymap.set("n", "<leader>aif", ":PiSendFile<CR>",                  { desc = "Send file to pi" })
vim.keymap.set("v", "<leader>aip", ":PiSendSelection<CR>",             { desc = "Send selection to pi" })
vim.keymap.set("n", "<leader>aib", ":PiSendBuffer<CR>",                { desc = "Send buffer to pi" })
vim.keymap.set("n", "<leader>aii", ":PiPing<CR>",                      { desc = "Ping pi" })
vim.keymap.set("n", "<leader>ais", ":PiSessions<CR>",                  { desc = "List pi sessions" })
