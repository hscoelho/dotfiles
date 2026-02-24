-- other themes I might add: sonokai

require('cyberdream').setup {
  variant = 'light',
  transparent = true,
  overrides = function(colors)
    return {
      Comment = { fg = colors.yellow, bg = 'NONE', italic = true },
    }
  end,
}
require('kanagawa').setup {
  transparent = true,
}

vim.cmd.colorscheme 'cyberdream'
