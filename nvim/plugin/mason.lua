if vim.g.vscode then
  return
end

require('mason').setup()
require('mason-tool-installer').setup {
  ensure_installed = {
    'firefox-debug-adapter',
    'chrome-debug-adapter',
    'codelldb',
    'angular-language-server',
    'html-lsp',
    'json-lsp',
    'jsonlint',
    'lua-language-server',
    'stylua',
    'vtsls',
    'eslint-lsp',
    'clangd',
    'markdownlint',
  },
}
