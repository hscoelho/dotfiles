if vim.g.vscode then
  return
end

require('ibl').setup()
require('guess-indent').setup {}
require('nvim-autopairs').setup()
require('todo-comments').setup(
  -- { signs = false }
)

require('which-key').setup {
  -- delay between pressing a key and opening which-key (milliseconds)
  -- this setting is independent of vim.o.timeoutlen
  delay = 0,
  icons = {
    mappings = true,
    keys = {},
  },

  -- Document existing key chains
  spec = {
    { '<leader>f', group = '[F]ind' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
}
