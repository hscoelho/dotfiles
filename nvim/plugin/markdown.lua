if vim.g.vscode then
  return
end

require('render-markdown').setup()
require('obsidian').setup {
  workspaces = {
    {
      name = 'SyncVault',
      path = '~/Documents/SyncVault',
    },
  },
  ui = {
    enable = false,
  },
}
