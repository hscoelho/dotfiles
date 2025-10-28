if vim.g.vscode then
  return
end

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'bash', 'c', 'diff', 'html', 'json5', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
  -- Autoinstall languages that are not installed
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = false },
}
