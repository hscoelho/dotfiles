return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- This is commented because I don't want cpptools to be installed automatically
      -- "mason-org/mason.nvim",
      -- optional = true,
      -- opts = { ensure_installed = { "cpptools" } },
    },
    opts = function()
      require("dap").adapters["cppdbg"] = {
        id = "cppdbg",
        type = "executable",
        command = "OpenDebugAD7",
        options = {
          detached = false,
        },
      }
    end,
  },
}
