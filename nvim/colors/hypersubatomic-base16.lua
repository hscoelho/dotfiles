-- not good and can't add transparency with this plugin
-- TODO: fork kanagawa or leaf and create this palette there
require('mini.base16').setup {
  palette = {
    base00 = '', -- default background
    -- base00 = '#0F111A', -- default background
    base01 = '#090B10', -- lighter background
    base02 = '#717CB4', -- selection background
    base03 = '#42577e', -- comments
    base04 = '#4B526D', -- dark foreground
    base05 = '#8F93A2', -- default foreground
    base06 = '#EEFFFF', -- light foreground
    base07 = '#1A1C25', -- light background
    base08 = '#ffc200', -- variables
    base09 = '#875afb', -- ints/bools
    base0A = '#ff7a00', -- classes
    base0B = '#f2283c', -- strings
    base0C = '#00a1b4', -- regex
    base0D = '#00ae6b', -- functions/methods
    base0E = '#875afb', -- keywords
    base0F = '#AE81FF', -- deprecated
  },
}
