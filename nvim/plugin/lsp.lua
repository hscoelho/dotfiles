if vim.g.vscode then
  return
end

-- web (typescript + html)
vim.lsp.enable 'html'
vim.lsp.enable 'vtsls'
vim.lsp.config('vtsls', {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@angular/language-server',
            localtion = vim.fn.expand '$MASON/packages/angular-language-server/node_modules/@angular/language-server',
            enableForWorkspaceTypeScriptVersions = false,
          },
        },
      },
    },
  },
})
vim.lsp.enable 'angularls'
vim.lsp.config('angularls', {
  server_capabilities = {
    -- fix duplicate renaming
    renameProvider = false,
  },
  -- maybe remove typescript from this...(since vtsls is also used in typescript)
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'htmlangular' },
})

-- json
vim.lsp.enable 'jsonls'
vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '.vscode/*.json', '.vscode/**/*.json' },
  callback = function()
    vim.bo.filetype = 'json5'
  end,
})

-- lua
vim.lsp.enable 'lua_ls'
vim.lsp.config('lua_ls', {
  -- cmd = { ... },
  -- filetypes = { ... },
  -- capabilities = {},
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
})
require('lazydev').setup {
  library = {
    -- Load luvit types when the `vim.uv` word is found
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

-- c/cpp
vim.lsp.enable 'clangd'

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}
