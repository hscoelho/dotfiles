if vim.g.vscode then
  return
end

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local enabled_filetypes = {
      rust = true,
      lua = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    else
      return nil
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
  },
}
