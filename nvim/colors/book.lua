vim.opt.termguicolors = true
vim.o.background = 'light'
vim.g.colors_name = 'book'
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd 'syntax reset'
end

local function hl(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- ============================================================
-- Base Palette
-- ============================================================
local palette = require 'book-theme-palette'
local bg = palette.bg
local bg_alt = palette.bg_alt
local bg_dim = palette.bg_dim
local bg_select = palette.bg_select

local fg = palette.fg
local fg_muted = palette.fg_muted
local fg_soft = palette.fg_soft

local red = palette.red
local green = palette.green
local blue = palette.blue
local yellow_light = palette.yellow_light
local magenta = palette.magenta
local red_light = palette.red_light
local cyan = palette.cyan
local magenta_light = palette.magenta_light
local yellow = palette.yellow
local green_light = palette.green_light
local blue_light = palette.blue_light
local cyan_light = palette.cyan_light

-- ============================================================
-- Semantic Roles  ← change these to retheme syntax
-- ============================================================
local strings = green -- string literals
local constants = magenta -- numbers, booleans, nil, symbols — statically known values
local comments = red -- comments
local definitions = blue -- global definitions: functions, types, classes
local errors = red_light -- errors & diagnostics
local warn = yellow_light -- warnings
local info = blue -- info diagnostics
local hint = cyan -- hints

local keywords = definitions -- testing this for now

local accent = red -- UI accent (not used for syntax)
local diff_add = green
local diff_del = red_light
local diff_change = yellow_light

local diff_add_bg = '#D4E8D0'
local diff_del_bg = '#EDD8CF'
local diff_change_bg = '#D0DCF0'
local diff_text_bg = '#BDD4F0'

local h1_bg = '#F5E8E8'
local h2_bg = '#E8EFF8'
local h3_bg = '#F5F0E0'
local h4_bg = '#E8F0E8'
local h5_bg = '#F0E8F5'
local h6_bg = '#E8F5F5'

-- ============================================================
-- 1. Core Editor
-- ============================================================
hl('Normal', { fg = fg, bg = 'NONE' })
hl('NormalNC', { fg = fg_soft, bg = 'NONE' })
hl('NormalFloat', { fg = fg, bg = bg_alt })
hl('FloatBorder', { fg = fg_muted, bg = bg_alt })
hl('FloatTitle', { fg = accent, bg = bg_alt, bold = true })
hl('ColorColumn', { bg = bg_dim })
hl('Conceal', { fg = fg_muted })
hl('CursorLine', { bg = bg_dim })
hl('CursorLineNr', { fg = fg_soft, bold = true })
hl('CursorColumn', { bg = bg_dim })
hl('Directory', { fg = blue })
hl('EndOfBuffer', { fg = bg_dim })
hl('ErrorMsg', { fg = errors, bold = true })
hl('Folded', { fg = fg_muted, bg = bg_alt })
hl('FoldColumn', { fg = fg_muted, bg = 'NONE' })
hl('LineNr', { fg = fg_muted })
hl('MatchParen', { fg = accent, bold = true, underline = true })
hl('ModeMsg', { fg = fg_soft })
hl('MoreMsg', { fg = green_light })
hl('NonText', { fg = bg_dim })
hl('Pmenu', { fg = fg, bg = bg_alt })
hl('PmenuSel', { fg = fg, bg = bg_select, bold = true })
hl('PmenuSbar', { bg = bg_dim })
hl('PmenuThumb', { bg = fg_muted })
hl('Question', { fg = green_light })
hl('QuickFixLine', { bg = bg_select })
hl('Search', { fg = fg, bg = bg_select, bold = true })
hl('IncSearch', { fg = fg, bg = yellow_light, bold = true })
hl('CurSearch', { fg = fg, bg = yellow_light, bold = true })
hl('SignColumn', { fg = fg_muted, bg = 'NONE' })
hl('SpecialKey', { fg = fg_muted })
hl('SpellBad', { undercurl = true, sp = errors })
hl('SpellCap', { undercurl = true, sp = blue })
hl('SpellLocal', { undercurl = true, sp = cyan })
hl('SpellRare', { undercurl = true, sp = magenta })
hl('StatusLine', { fg = fg_soft, bg = bg_dim })
hl('StatusLineNC', { fg = fg_muted, bg = bg_dim })
hl('Substitute', { fg = fg, bg = diff_del, bold = true })
hl('TabLine', { fg = fg_muted, bg = bg_dim })
hl('TabLineFill', { bg = bg_dim })
hl('TabLineSel', { fg = fg, bg = bg_alt, bold = true })
hl('Title', { fg = accent, bold = true })
hl('Visual', { bg = bg_select })
hl('VisualNOS', { bg = bg_select })
hl('WarningMsg', { fg = warn, bold = true })
hl('Whitespace', { fg = bg_dim })
hl('WildMenu', { fg = fg, bg = bg_select })
hl('WinSeparator', { fg = bg_dim })
hl('WinBar', { fg = fg_soft, bg = 'NONE' })
hl('WinBarNC', { fg = fg_muted, bg = 'NONE' })

-- Diff
hl('DiffAdd', { fg = diff_add, bg = diff_add_bg })
hl('DiffChange', { fg = diff_change, bg = diff_change_bg })
hl('DiffDelete', { fg = diff_del, bg = diff_del_bg })
hl('DiffText', { fg = diff_change, bg = diff_text_bg, bold = true })
hl('diffAdded', { fg = diff_add })
hl('diffRemoved', { fg = diff_del })
hl('diffChanged', { fg = blue })
hl('diffFile', { fg = yellow_light, bold = true })
hl('diffLine', { fg = fg_muted })

-- ============================================================
-- 2. Syntax  (Alabaster: 4 classes + everything else = fg)
-- ============================================================

-- The four classes
hl('Comment', { fg = comments }) -- prominent, not dimmed
hl('String', { fg = strings })
hl('Character', { fg = strings })
hl('Number', { fg = constants })
hl('Float', { fg = constants })
hl('Boolean', { fg = constants })
hl('Constant', { fg = constants }) -- nil, true, false, etc.

-- Global definitions (function names, type names at definition site)
hl('Function', { fg = definitions })
hl('Type', { fg = definitions })
hl('StorageClass', { fg = definitions })
hl('Structure', { fg = definitions })
hl('Typedef', { fg = definitions })

-- Everything else: no highlighting (control flow, operators, identifiers)
hl('Identifier', { fg = fg })
hl('Statement', { fg = fg })
hl('Conditional', { fg = fg })
hl('Repeat', { fg = fg })
hl('Label', { fg = fg })
hl('Operator', { fg = fg })
hl('Keyword', { fg = keywords })
hl('Exception', { fg = fg })
hl('PreProc', { fg = fg })
hl('Include', { fg = fg })
hl('Define', { fg = fg })
hl('Macro', { fg = fg })
hl('PreCondit', { fg = fg })
hl('Special', { fg = fg })
hl('SpecialChar', { fg = fg })
hl('Tag', { fg = fg })
hl('Delimiter', { fg = fg_soft })
hl('SpecialComment', { fg = comments })
hl('Debug', { fg = errors })
hl('Underlined', { underline = true })
hl('Ignore', { fg = fg_muted })
hl('Error', { fg = errors, bold = true })
hl('Todo', { fg = comments, bold = true })

-- ============================================================
-- 3. Treesitter
-- ============================================================

-- Variables & identifiers → fg
hl('@variable', { fg = fg })
hl('@variable.builtin', { fg = constants }) -- self, this, nil
hl('@variable.parameter', { fg = fg })
hl('@variable.member', { fg = fg })

-- Constants → constants color
hl('@constant', { fg = constants })
hl('@constant.builtin', { fg = constants }) -- true, false, nil
hl('@constant.macro', { fg = constants })

-- Modules/namespaces → definitions (they're global defs)
hl('@module', { fg = definitions })
hl('@module.builtin', { fg = definitions })
hl('@label', { fg = fg })

-- Strings → strings color
hl('@string', { fg = strings })
hl('@string.documentation', { fg = strings })
hl('@string.regexp', { fg = strings }) -- regex is still a string
hl('@string.escape', { fg = strings })
hl('@string.special', { fg = strings })
hl('@string.special.symbol', { fg = constants }) -- symbols/atoms are constants
hl('@string.special.url', { fg = strings, underline = true })

hl('@character', { fg = strings })
hl('@character.special', { fg = strings })
hl('@number', { fg = constants })
hl('@number.float', { fg = constants })
hl('@boolean', { fg = constants })

-- Types → definitions
hl('@type', { fg = definitions })
hl('@type.builtin', { fg = definitions })
hl('@type.definition', { fg = definitions })

hl('@attribute', { fg = fg })
hl('@attribute.builtin', { fg = fg })
hl('@property', { fg = fg })

-- Functions: definition site → definitions, call site → fg
hl('@function', { fg = definitions }) -- definition
hl('@function.builtin', { fg = fg }) -- builtin calls (print, len, etc.)
hl('@function.call', { fg = fg }) -- call site: no highlight
hl('@function.macro', { fg = fg })
hl('@function.method', { fg = definitions }) -- method definition
hl('@function.method.call', { fg = fg }) -- method call: no highlight

hl('@constructor', { fg = definitions })
hl('@operator', { fg = fg })

-- Keywords: ALL control flow → fg (Alabaster: least important, most obvious)
hl('@keyword', { fg = keywords })
hl('@keyword.coroutine', { fg = keywords })
hl('@keyword.function', { fg = keywords })
hl('@keyword.operator', { fg = keywords })
hl('@keyword.import', { fg = keywords })
hl('@keyword.type', { fg = keywords })
hl('@keyword.modifier', { fg = keywords })
hl('@keyword.repeat', { fg = keywords })
hl('@keyword.return', { fg = keywords })
hl('@keyword.debug', { fg = keywords })
hl('@keyword.exception', { fg = keywords })
hl('@keyword.conditional', { fg = keywords })
hl('@keyword.conditional.ternary', { fg = keywords })
hl('@keyword.directive', { fg = keywords })
hl('@keyword.directive.define', { fg = keywords })

hl('@punctuation.delimiter', { fg = fg_soft })
hl('@punctuation.bracket', { fg = fg_soft })
hl('@punctuation.special', { fg = fg_soft })

-- Comments → prominent blue
hl('@comment', { fg = comments })
hl('@comment.documentation', { fg = comments })
hl('@comment.error', { fg = errors })
hl('@comment.warning', { fg = warn })
hl('@comment.todo', { fg = comments, bold = true })
hl('@comment.note', { fg = comments, bold = true })

-- Markup (markdown etc.) — keep meaningful distinctions here
hl('@markup.strong', { bold = true })
hl('@markup.italic', { italic = true })
hl('@markup.strikethrough', { strikethrough = true })
hl('@markup.underline', { underline = true })
hl('@markup.heading', { fg = accent, bold = true })
hl('@markup.heading.1', { fg = accent, bold = true })
hl('@markup.heading.2', { fg = blue, bold = true })
hl('@markup.heading.3', { fg = yellow_light, bold = true })
hl('@markup.heading.4', { fg = green, bold = true })
hl('@markup.heading.5', { fg = magenta, bold = true })
hl('@markup.heading.6', { fg = cyan, bold = true })
hl('@markup.quote', { fg = comments })
hl('@markup.math', { fg = constants })
hl('@markup.link', { fg = blue, underline = true })
hl('@markup.link.label', { fg = blue })
hl('@markup.link.url', { fg = strings, underline = true })
hl('@markup.raw', { fg = strings, bg = bg_alt })
hl('@markup.raw.block', { fg = fg, bg = bg_alt })
hl('@markup.list', { fg = fg_soft })
hl('@markup.list.checked', { fg = green_light })
hl('@markup.list.unchecked', { fg = fg_muted })

hl('@diff.plus', { fg = diff_add })
hl('@diff.minus', { fg = diff_del })
hl('@diff.delta', { fg = blue })

-- Tags (HTML/JSX)
hl('@tag', { fg = fg })
hl('@tag.builtin', { fg = fg })
hl('@tag.attribute', { fg = fg })
hl('@tag.delimiter', { fg = fg_soft })

-- ============================================================
-- 4. LSP
-- ============================================================
hl('DiagnosticError', { fg = errors })
hl('DiagnosticWarn', { fg = warn })
hl('DiagnosticInfo', { fg = info })
hl('DiagnosticHint', { fg = hint })
hl('DiagnosticOk', { fg = diff_add })

hl('DiagnosticVirtualTextError', { fg = errors })
hl('DiagnosticVirtualTextWarn', { fg = warn })
hl('DiagnosticVirtualTextInfo', { fg = info })
hl('DiagnosticVirtualTextHint', { fg = hint })
hl('DiagnosticVirtualTextOk', { fg = diff_add })

hl('DiagnosticUnderlineError', { undercurl = true, sp = errors })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = warn })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = info })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = hint })
hl('DiagnosticUnderlineOk', { undercurl = true, sp = diff_add })

hl('DiagnosticSignError', { fg = errors })
hl('DiagnosticSignWarn', { fg = warn })
hl('DiagnosticSignInfo', { fg = info })
hl('DiagnosticSignHint', { fg = hint })

hl('DiagnosticFloatingError', { fg = errors })
hl('DiagnosticFloatingWarn', { fg = warn })
hl('DiagnosticFloatingInfo', { fg = info })
hl('DiagnosticFloatingHint', { fg = hint })

hl('LspReferenceText', { bg = bg_select })
hl('LspReferenceRead', { bg = bg_select })
hl('LspReferenceWrite', { bg = bg_select, bold = true })
hl('LspInlayHint', { fg = fg_muted })
hl('LspCodeLens', { fg = fg_muted })
hl('LspSignatureActiveParameter', { fg = blue_light, bold = true })

-- ============================================================
-- 5. gitsigns.nvim
-- ============================================================
hl('GitSignsAdd', { fg = diff_add })
hl('GitSignsChange', { fg = diff_change })
hl('GitSignsDelete', { fg = diff_del })
hl('GitSignsAddNr', { fg = diff_add })
hl('GitSignsChangeNr', { fg = diff_change })
hl('GitSignsDeleteNr', { fg = diff_del })
hl('GitSignsAddLn', { bg = diff_add })
hl('GitSignsChangeLn', { bg = diff_change })
hl('GitSignsDeleteLn', { bg = diff_del })
hl('GitSignsCurrentLineBlame', { fg = fg_muted })
hl('GitSignsAddPreview', { bg = diff_add_bg })
hl('GitSignsDeletePreview', { bg = diff_del_bg })

-- ============================================================
-- 6. fzf-lua
-- ============================================================
hl('FzfLuaNormal', { fg = fg, bg = bg_alt })
hl('FzfLuaBorder', { fg = fg_muted, bg = bg_alt })
hl('FzfLuaTitle', { fg = accent, bg = bg_alt, bold = true })
hl('FzfLuaPreviewNormal', { fg = fg, bg = bg })
hl('FzfLuaPreviewBorder', { fg = fg_muted, bg = bg })
hl('FzfLuaPreviewTitle', { fg = accent, bg = bg, bold = true })
hl('FzfLuaCursorLine', { bg = bg_select })
hl('FzfLuaHeaderText', { fg = yellow_light, bold = true })
hl('FzfLuaHeaderBind', { fg = cyan_light })
hl('FzfLuaPathColNr', { fg = constants })
hl('FzfLuaPathLineNr', { fg = diff_add })
hl('FzfLuaBufFlagCur', { fg = accent })
hl('FzfLuaBufFlagAlt', { fg = blue })
hl('FzfLuaTabTitle', { fg = blue, bold = true })
hl('FzfLuaTabMarker', { fg = yellow_light })

-- ============================================================
-- 7. blink.cmp
-- ============================================================
hl('BlinkCmpMenu', { fg = fg, bg = bg_alt })
hl('BlinkCmpMenuBorder', { fg = fg_muted, bg = bg_alt })
hl('BlinkCmpMenuSelection', { bg = bg_select })
hl('BlinkCmpScrollBarThumb', { bg = fg_muted })
hl('BlinkCmpScrollBarGutter', { bg = bg_dim })
hl('BlinkCmpLabel', { fg = fg })
hl('BlinkCmpLabelDeprecated', { fg = fg_muted, strikethrough = true })
hl('BlinkCmpLabelMatch', { fg = blue_light, bold = true })
hl('BlinkCmpLabelDetail', { fg = fg_muted })
hl('BlinkCmpLabelDescription', { fg = fg_muted })
hl('BlinkCmpKind', { fg = fg_soft })
hl('BlinkCmpKindText', { fg = fg_soft })
hl('BlinkCmpKindMethod', { fg = definitions })
hl('BlinkCmpKindFunction', { fg = definitions })
hl('BlinkCmpKindConstructor', { fg = definitions })
hl('BlinkCmpKindField', { fg = fg })
hl('BlinkCmpKindVariable', { fg = fg })
hl('BlinkCmpKindClass', { fg = definitions })
hl('BlinkCmpKindInterface', { fg = definitions })
hl('BlinkCmpKindModule', { fg = definitions })
hl('BlinkCmpKindProperty', { fg = fg })
hl('BlinkCmpKindUnit', { fg = constants })
hl('BlinkCmpKindValue', { fg = constants })
hl('BlinkCmpKindEnum', { fg = definitions })
hl('BlinkCmpKindKeyword', { fg = keywords })
hl('BlinkCmpKindSnippet', { fg = diff_add })
hl('BlinkCmpKindColor', { fg = fg_soft })
hl('BlinkCmpKindFile', { fg = blue })
hl('BlinkCmpKindReference', { fg = cyan_light })
hl('BlinkCmpKindFolder', { fg = blue })
hl('BlinkCmpKindEnumMember', { fg = constants })
hl('BlinkCmpKindConstant', { fg = constants })
hl('BlinkCmpKindStruct', { fg = definitions })
hl('BlinkCmpKindEvent', { fg = fg_soft })
hl('BlinkCmpKindOperator', { fg = fg })
hl('BlinkCmpKindTypeParameter', { fg = definitions })
hl('BlinkCmpDoc', { fg = fg, bg = bg_alt })
hl('BlinkCmpDocBorder', { fg = fg_muted, bg = bg_alt })
hl('BlinkCmpDocSeparator', { fg = fg_muted })
hl('BlinkCmpDocCursorLine', { bg = bg_select })
hl('BlinkCmpSignatureHelp', { fg = fg, bg = bg_alt })
hl('BlinkCmpSignatureHelpBorder', { fg = fg_muted, bg = bg_alt })
hl('BlinkCmpSignatureHelpActiveParameter', { fg = blue_light, bold = true })

-- ============================================================
-- 8. mini.statusline
-- ============================================================
hl('MiniStatuslineModeNormal', { fg = bg_dim, bg = accent, bold = true })
hl('MiniStatuslineModeInsert', { fg = bg_dim, bg = cyan, bold = true })
hl('MiniStatuslineModeVisual', { fg = bg_dim, bg = magenta, bold = true })
hl('MiniStatuslineModeReplace', { fg = bg_dim, bg = red_light, bold = true })
hl('MiniStatuslineModeCommand', { fg = bg_dim, bg = yellow_light, bold = true })
hl('MiniStatuslineModeOther', { fg = bg_dim, bg = cyan_light, bold = true })
hl('MiniStatuslineFilename', { fg = fg_soft, bg = bg_dim })
hl('MiniStatuslineFileinfo', { fg = fg_soft, bg = bg_dim })
hl('MiniStatuslineDevinfo', { fg = fg_soft, bg = bg_dim })
hl('MiniStatuslineInactive', { fg = fg_muted, bg = bg_dim })

-- ============================================================
-- 9. indent-blankline
-- ============================================================
hl('IblIndent', { fg = bg_dim })
hl('IblScope', { fg = bg_select })

-- ============================================================
-- 10. which-key
-- ============================================================
hl('WhichKey', { fg = accent, bold = true })
hl('WhichKeyBorder', { fg = fg_muted, bg = bg_alt })
hl('WhichKeyNormal', { fg = fg, bg = bg_alt })
hl('WhichKeyGroup', { fg = blue_light })
hl('WhichKeyDesc', { fg = fg })
hl('WhichKeySeparator', { fg = fg_muted })
hl('WhichKeyValue', { fg = fg_muted })
hl('WhichKeyTitle', { fg = accent, bold = true })

-- ============================================================
-- 11. snacks.nvim
-- ============================================================
hl('SnacksNotifierInfo', { fg = info })
hl('SnacksNotifierWarn', { fg = warn })
hl('SnacksNotifierError', { fg = errors })
hl('SnacksNotifierDebug', { fg = fg_muted })
hl('SnacksNotifierTrace', { fg = constants })
hl('SnacksNotifierBorderInfo', { fg = info })
hl('SnacksNotifierBorderWarn', { fg = warn })
hl('SnacksNotifierBorderError', { fg = errors })
hl('SnacksNotifierBorderDebug', { fg = fg_muted })
hl('SnacksNotifierBorderTrace', { fg = constants })
hl('SnacksNotifierTitleInfo', { fg = info, bold = true })
hl('SnacksNotifierTitleWarn', { fg = warn, bold = true })
hl('SnacksNotifierTitleError', { fg = errors, bold = true })
hl('SnacksNotifierTitleDebug', { fg = fg_muted, bold = true })
hl('SnacksNotifierTitleTrace', { fg = constants, bold = true })
hl('SnacksNormal', { fg = fg, bg = bg_alt })
hl('SnacksDashboardHeader', { fg = accent, bold = true })
hl('SnacksDashboardFooter', { fg = fg_muted })
hl('SnacksDashboardTitle', { fg = blue_light, bold = true })
hl('SnacksDashboardDesc', { fg = fg })
hl('SnacksDashboardKey', { fg = yellow_light, bold = true })
hl('SnacksDashboardIcon', { fg = blue_light })

-- ============================================================
-- 12. todo-comments
-- ============================================================
-- TODO:
-- FIXME:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
hl('TodoFgTODO', { fg = cyan })
hl('TodoFgFIXME', { fg = errors })
hl('TodoFgHACK', { fg = magenta_light })
hl('TodoFgWARN', { fg = warn })
hl('TodoFgPERF', { fg = constants })
hl('TodoFgNOTE', { fg = info })
hl('TodoFgTEST', { fg = strings })

hl('TodoBgTODO', { fg = bg, bg = cyan, bold = true })
hl('TodoBgFIXME', { fg = bg, bg = errors, bold = true })
hl('TodoBgHACK', { fg = bg, bg = magenta_light, bold = true })
hl('TodoBgWARN', { fg = bg, bg = warn, bold = true })
hl('TodoBgPERF', { fg = bg, bg = constants, bold = true })
hl('TodoBgNOTE', { fg = bg, bg = info, bold = true })
hl('TodoBgTEST', { fg = bg, bg = strings, bold = true })

hl('TodoSignTODO', { fg = cyan })
hl('TodoSignFIXME', { fg = errors })
hl('TodoSignHACK', { fg = magenta_light })
hl('TodoSignWARN', { fg = warn })
hl('TodoSignPERF', { fg = constants })
hl('TodoSignNOTE', { fg = info })
hl('TodoSignTEST', { fg = strings })

-- ============================================================
-- 13. render-markdown
-- ============================================================
hl('RenderMarkdownH1', { fg = accent, bg = h1_bg, bold = true })
hl('RenderMarkdownH2', { fg = blue, bg = h2_bg, bold = true })
hl('RenderMarkdownH3', { fg = yellow_light, bg = h3_bg, bold = true })
hl('RenderMarkdownH4', { fg = diff_add, bg = h4_bg, bold = true })
hl('RenderMarkdownH5', { fg = constants, bg = h5_bg, bold = true })
hl('RenderMarkdownH6', { fg = strings, bg = h6_bg, bold = true })
hl('RenderMarkdownH1Bg', { bg = h1_bg })
hl('RenderMarkdownH2Bg', { bg = h2_bg })
hl('RenderMarkdownH3Bg', { bg = h3_bg })
hl('RenderMarkdownH4Bg', { bg = h4_bg })
hl('RenderMarkdownH5Bg', { bg = h5_bg })
hl('RenderMarkdownH6Bg', { bg = h6_bg })
hl('RenderMarkdownCode', { bg = bg_dim })
hl('RenderMarkdownCodeInline', { fg = diff_del, bg = bg_dim })
hl('RenderMarkdownBullet', { fg = fg_soft })
hl('RenderMarkdownQuote', { fg = comments })
hl('RenderMarkdownLink', { fg = blue, underline = true })
hl('RenderMarkdownWikiLink', { fg = blue, underline = true })
hl('RenderMarkdownTableHead', { fg = accent, bold = true })
hl('RenderMarkdownTableRow', { fg = fg })
hl('RenderMarkdownTableFill', { fg = fg_muted })
hl('RenderMarkdownMath', { fg = constants })
hl('RenderMarkdownDash', { fg = bg_select })
hl('RenderMarkdownSign', { fg = fg_soft })
hl('RenderMarkdownUnchecked', { fg = fg_muted })
hl('RenderMarkdownChecked', { fg = green_light })
hl('RenderMarkdownTodo', { fg = comments, bold = true })

-- ============================================================
-- 14. dropbar
-- ============================================================
hl('DropBarMenuCurrentContext', { bg = bg_select })
hl('DropBarMenuNormalFloat', { fg = fg, bg = bg_alt })
hl('DropBarMenuHoverEntry', { bg = bg_select })
hl('DropBarMenuHoverIcon', { bg = bg_select })
hl('DropBarMenuHoverSymbol', { italic = true })
hl('DropBarMenuSbar', { bg = bg_dim })
hl('DropBarMenuThumb', { bg = fg_muted })
hl('DropBarIconUiSeparator', { fg = fg_muted })
hl('DropBarIconUiIndicator', { fg = fg_muted })
hl('DropBarIconUiMenu', { fg = blue })
hl('DropBarIconUiPickPivot', { fg = accent })
hl('DropBarKindArray', { fg = definitions })
hl('DropBarKindBoolean', { fg = constants })
hl('DropBarKindBreakStatement', { fg = fg })
hl('DropBarKindCall', { fg = fg })
hl('DropBarKindCaseStatement', { fg = fg })
hl('DropBarKindClass', { fg = definitions })
hl('DropBarKindConstant', { fg = constants })
hl('DropBarKindConstructor', { fg = definitions })
hl('DropBarKindEnum', { fg = definitions })
hl('DropBarKindEnumMember', { fg = constants })
hl('DropBarKindEvent', { fg = fg_soft })
hl('DropBarKindField', { fg = fg })
hl('DropBarKindFile', { fg = blue })
hl('DropBarKindFolder', { fg = blue })
hl('DropBarKindFunction', { fg = definitions })
hl('DropBarKindIdentifier', { fg = fg })
hl('DropBarKindIfStatement', { fg = fg })
hl('DropBarKindInterface', { fg = definitions })
hl('DropBarKindKeyword', { fg = keywords })
hl('DropBarKindList', { fg = definitions })
hl('DropBarKindMacro', { fg = fg })
hl('DropBarKindMarkdownH1', { fg = accent, bold = true })
hl('DropBarKindMarkdownH2', { fg = blue, bold = true })
hl('DropBarKindMarkdownH3', { fg = yellow_light, bold = true })
hl('DropBarKindMarkdownH4', { fg = diff_add, bold = true })
hl('DropBarKindMarkdownH5', { fg = constants, bold = true })
hl('DropBarKindMarkdownH6', { fg = strings, bold = true })
hl('DropBarKindMethod', { fg = definitions })
hl('DropBarKindModule', { fg = definitions })
hl('DropBarKindNamespace', { fg = definitions })
hl('DropBarKindNull', { fg = constants })
hl('DropBarKindNumber', { fg = constants })
hl('DropBarKindObject', { fg = definitions })
hl('DropBarKindOperator', { fg = fg })
hl('DropBarKindPackage', { fg = definitions })
hl('DropBarKindProperty', { fg = fg })
hl('DropBarKindReference', { fg = cyan_light })
hl('DropBarKindRepeatStatement', { fg = fg })
hl('DropBarKindScope', { fg = fg_soft })
hl('DropBarKindSpecifier', { fg = fg })
hl('DropBarKindStatement', { fg = fg })
hl('DropBarKindString', { fg = strings })
hl('DropBarKindStruct', { fg = definitions })
hl('DropBarKindSwitchStatement', { fg = fg })
hl('DropBarKindType', { fg = definitions })
hl('DropBarKindTypeParameter', { fg = definitions })
hl('DropBarKindUnit', { fg = constants })
hl('DropBarKindValue', { fg = constants })
hl('DropBarKindVariable', { fg = fg })

-- ============================================================
-- 15. hunk.nvim
-- ============================================================
hl('HunkNormal', { fg = fg, bg = bg_alt })
hl('HunkAdd', { fg = diff_add, bg = diff_add_bg })
hl('HunkDelete', { fg = diff_del, bg = diff_del_bg })
hl('HunkHeader', { fg = blue, bold = true })
