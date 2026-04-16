if vim.g.vscode then
  return
end

-- web (typescript + html)
vim.lsp.enable 'html'
-- vim.lsp.config('vtsls', {
--   settings = {
--     vtsls = {
--       tsserver = {
--         globalPlugins = {
--           {
--             name = '@angular/language-server',
--             location = vim.fn.expand '$MASON/packages/angular-language-server/node_modules/@angular/language-server',
--             enableForWorkspaceTypeScriptVersions = false,
--           },
--         },
--       },
--     },
--   },
-- })
-- vim.lsp.enable 'vtsls'
vim.lsp.enable 'tsgo'
vim.lsp.config('angularls', {
  root_dir = function(fname)
    return vim.fs.root(fname, { 'angular.json' })
  end,
  filetypes = { 'typescript', 'htmlangular', 'html' },
})
vim.lsp.enable 'angularls'

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- If angularls is attached, it handles references and definitions across TS and HTML.
    -- We disable tsgo providers in this case to avoid duplicates and ensure HTML references are shown.
    if client.name == 'angularls' then
      local tsgo = vim.lsp.get_clients({ bufnr = args.buf, name = 'tsgo' })[1]
      if tsgo then
        tsgo.server_capabilities.referencesProvider = false
        tsgo.server_capabilities.definitionProvider = false
        tsgo.server_capabilities.renameProvider = false
      end
    elseif client.name == 'tsgo' then
      local angularls = vim.lsp.get_clients({ bufnr = args.buf, name = 'angularls' })[1]
      if angularls then
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.renameProvider = false
      end
    end
  end,
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
  -- pattern = { '.vscode/*.json', '.vscode/**/*.json' },
  pattern = { '*.json' },
  callback = function()
    vim.bo.filetype = 'json5'
  end,
})

-- lua
vim.lsp.enable 'lua_ls'
vim.lsp.config('lua_ls', {
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

vim.lsp.enable 'nushell'

require('lean').setup {
  mappings = true,
}

-- This is a grammar check (that only works in english)
vim.lsp.enable 'harper_ls'
