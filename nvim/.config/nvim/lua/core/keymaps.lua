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

-- Debug (DAP)
wk.add({ { "<leader>d", group = "Debug" } })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debug: Set Logpoint" })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Debug: Toggle REPL" })
vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end, { desc = "Debug: Run Last" })
vim.keymap.set("n", "<leader>dR", function()
    require("dapui").float_element("repl")
end, { desc = "Debug: Repl" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Debug: Terminate" })
vim.keymap.set("n", "<leader>dh", function() require("dap").pause() end, { desc = "Debug: Pause" })
-- DAP UI (if using dap-ui)
vim.keymap.set("n", "<leader>dU", function()
    local dapui = require("dapui")
    if dapui.is_open() then
        dapui.close()
    else
        dapui.open()
    end
end, { desc = "Debug: Toggle DAP UI" })
-- Scrolloff-friendly scroll in debug panels
vim.keymap.set("n", "<leader>ds", function()
    local dapui = require("dapui")
    dapui.float_element({ source = "scopes", size = { width = 0.3, height = 0.5 } })
end, { desc = "Debug: Scopes" })

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



