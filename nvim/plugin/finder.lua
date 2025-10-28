if vim.g.vscode then
  return
end

require('fzf-lua').setup {
  winopts = {
    preview = {
      layout = 'vertical',
    },
  },
  oldfiles = {
    include_current_session = true,
  },
}
require('fzf-lua').register_ui_select()
