local dap = require "dap"
local dapui = require "dapui"

dap.adapters.codelldb = {
  type = "server",
  port = 13000,
  executable = {
    command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "13000" },

    detached = vim.loop.os_uname().sysname ~= "Windows_NT",
  },
}

dap.adapters.lldb = {
  type = "server",
  port = 13000,
  executable = {
    command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "13000" },

    detached = vim.loop.os_uname().sysname ~= "Windows_NT",
  },
}

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- DAP keymappings
local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
map("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })

-- dap additional example keymappings
map("n", "<Leader>db", function()
  require("dap").toggle_breakpoint()
end)
map("n", "<Leader>dB", function()
  require("dap").set_breakpoint()
end)
map("n", "<Leader>dlp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end)
map("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
map("n", "<Leader>dl", function()
  require("dap").run_last()
end)
map({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
map({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
map("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)
map("n", "<Leader>ds", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end)
