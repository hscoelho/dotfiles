return {
  {
    'b0o/schemastore.nvim',
    config = function()
      -- consider vscode json files as json5
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        pattern = { '.vscode/*.json', '.vscode/**/*.json' },
        callback = function()
          vim.bo.filetype = 'json5'
        end,
      })

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = util.list_insert_unique(opts.ensure_installed, { 'json-lsp', 'jsonlint' })
    end,
  },
}
