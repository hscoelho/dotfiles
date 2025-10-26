if vim.g.vscode then
  return
end

require('fidget').setup {
  notification = {
    -- Options related to the notification window and buffer
    window = {
      winblend = 0, -- Background color opacity in the notification window
    },
  },
}
