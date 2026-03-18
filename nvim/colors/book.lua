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
local bg = '#FBF0D9'
local bg_alt = '#F2EBDC'
local bg_dim = '#E6DBC5'
local bg_select = '#E0D3AF'

local fg = '#000000'
local fg_muted = '#928374'
local fg_soft = '#504945'

local burgundy = '#8B1A1A'
local forest = '#4B7A47'
local navy = '#2D5B8E'
local gold = '#996D00'
local plum = '#7A4A80'
local clay = '#8F3F2D'
local sage = '#2A7B7B'
local rose = '#A0416A'
local brown = '#6B4226'

-- ============================================================
-- Semantic Roles  ← change these to retheme syntax
-- ============================================================
local strings = forest -- string literals
local constants = plum -- numbers, booleans, nil, symbols — statically known values
local comments = burgundy -- comments
local definitions = navy -- global definitions: functions, types, classes
local errors = clay -- errors & diagnostics
local warn = gold -- warnings
local info = navy -- info diagnostics
local hint = sage -- hints

local accent = burgundy -- UI accent (not used for syntax)
local diff_add = sage -- diff additions
local diff_del = clay -- diff deletions

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
hl('Directory', { fg = navy })
hl('EndOfBuffer', { fg = bg_dim })
hl('ErrorMsg', { fg = errors, bold = true })
hl('Folded', { fg = fg_muted, bg = bg_alt })
hl('FoldColumn', { fg = fg_muted, bg = 'NONE' })
hl('LineNr', { fg = fg_muted })
hl('MatchParen', { fg = accent, bold = true, underline = true })
hl('ModeMsg', { fg = fg_soft })
hl('MoreMsg', { fg = forest })
hl('NonText', { fg = bg_dim })
hl('Pmenu', { fg = fg, bg = bg_alt })
hl('PmenuSel', { fg = fg, bg = bg_select, bold = true })
hl('PmenuSbar', { bg = bg_dim })
hl('PmenuThumb', { bg = fg_muted })
hl('Question', { fg = forest })
hl('QuickFixLine', { bg = bg_select })
hl('Search', { fg = fg, bg = bg_select, bold = true })
hl('IncSearch', { fg = fg, bg = gold, bold = true })
hl('CurSearch', { fg = fg, bg = gold, bold = true })
hl('SignColumn', { fg = fg_muted, bg = 'NONE' })
hl('SpecialKey', { fg = fg_muted })
hl('SpellBad', { undercurl = true, sp = errors })
hl('SpellCap', { undercurl = true, sp = navy })
hl('SpellLocal', { undercurl = true, sp = sage })
hl('SpellRare', { undercurl = true, sp = plum })
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
hl('DiffChange', { fg = navy, bg = diff_change_bg })
hl('DiffDelete', { fg = diff_del, bg = diff_del_bg })
hl('DiffText', { fg = navy, bg = diff_text_bg, bold = true })
hl('diffAdded', { fg = diff_add })
hl('diffRemoved', { fg = diff_del })
hl('diffChanged', { fg = navy })
hl('diffFile', { fg = gold, bold = true })
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
hl('Keyword', { fg = fg })
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
hl('@keyword', { fg = fg })
hl('@keyword.coroutine', { fg = fg })
hl('@keyword.function', { fg = fg })
hl('@keyword.operator', { fg = fg })
hl('@keyword.import', { fg = fg })
hl('@keyword.type', { fg = fg })
hl('@keyword.modifier', { fg = fg })
hl('@keyword.repeat', { fg = fg })
hl('@keyword.return', { fg = fg })
hl('@keyword.debug', { fg = fg })
hl('@keyword.exception', { fg = fg })
hl('@keyword.conditional', { fg = fg })
hl('@keyword.conditional.ternary', { fg = fg })
hl('@keyword.directive', { fg = fg })
hl('@keyword.directive.define', { fg = fg })

hl('@punctuation.delimiter', { fg = fg_soft })
hl('@punctuation.bracket', { fg = fg_soft })
hl('@punctuation.special', { fg = fg_soft })

-- Comments → prominent navy
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
hl('@markup.heading.2', { fg = navy, bold = true })
hl('@markup.heading.3', { fg = gold, bold = true })
hl('@markup.heading.4', { fg = forest, bold = true })
hl('@markup.heading.5', { fg = plum, bold = true })
hl('@markup.heading.6', { fg = sage, bold = true })
hl('@markup.quote', { fg = comments })
hl('@markup.math', { fg = constants })
hl('@markup.link', { fg = navy, underline = true })
hl('@markup.link.label', { fg = navy })
hl('@markup.link.url', { fg = strings, underline = true })
hl('@markup.raw', { fg = strings, bg = bg_alt })
hl('@markup.raw.block', { fg = fg, bg = bg_alt })
hl('@markup.list', { fg = fg_soft })
hl('@markup.list.checked', { fg = diff_add })
hl('@markup.list.unchecked', { fg = fg_muted })

hl('@diff.plus', { fg = diff_add })
hl('@diff.minus', { fg = diff_del })
hl('@diff.delta', { fg = navy })

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
hl('LspSignatureActiveParameter', { fg = navy, bold = true })

-- ============================================================
-- 5. gitsigns.nvim
-- ============================================================
hl('GitSignsAdd', { fg = diff_add })
hl('GitSignsChange', { fg = navy })
hl('GitSignsDelete', { fg = diff_del })
hl('GitSignsAddNr', { fg = diff_add })
hl('GitSignsChangeNr', { fg = navy })
hl('GitSignsDeleteNr', { fg = diff_del })
hl('GitSignsAddLn', { bg = diff_add_bg })
hl('GitSignsChangeLn', { bg = diff_change_bg })
hl('GitSignsDeleteLn', { bg = diff_del_bg })
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
hl('FzfLuaHeaderText', { fg = gold, bold = true })
hl('FzfLuaHeaderBind', { fg = sage })
hl('FzfLuaPathColNr', { fg = constants })
hl('FzfLuaPathLineNr', { fg = diff_add })
hl('FzfLuaBufFlagCur', { fg = accent })
hl('FzfLuaBufFlagAlt', { fg = navy })
hl('FzfLuaTabTitle', { fg = navy, bold = true })
hl('FzfLuaTabMarker', { fg = gold })

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
hl('BlinkCmpLabelMatch', { fg = navy, bold = true })
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
hl('BlinkCmpKindKeyword', { fg = fg })
hl('BlinkCmpKindSnippet', { fg = diff_add })
hl('BlinkCmpKindColor', { fg = fg_soft })
hl('BlinkCmpKindFile', { fg = navy })
hl('BlinkCmpKindReference', { fg = sage })
hl('BlinkCmpKindFolder', { fg = navy })
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
hl('BlinkCmpSignatureHelpActiveParameter', { fg = navy, bold = true })

-- ============================================================
-- 8. mini.statusline
-- ============================================================
hl('MiniStatuslineModeNormal', { fg = bg_dim, bg = accent, bold = true })
hl('MiniStatuslineModeInsert', { fg = bg_dim, bg = sage, bold = true })
hl('MiniStatuslineModeVisual', { fg = bg_dim, bg = plum, bold = true })
hl('MiniStatuslineModeReplace', { fg = bg_dim, bg = clay, bold = true })
hl('MiniStatuslineModeCommand', { fg = bg_dim, bg = gold, bold = true })
hl('MiniStatuslineModeOther', { fg = bg_dim, bg = sage, bold = true })
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
hl('WhichKeyGroup', { fg = navy })
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
hl('SnacksDashboardTitle', { fg = navy, bold = true })
hl('SnacksDashboardDesc', { fg = fg })
hl('SnacksDashboardKey', { fg = gold, bold = true })
hl('SnacksDashboardIcon', { fg = navy })

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
hl('TodoFgTODO', { fg = sage })
hl('TodoFgFIXME', { fg = errors })
hl('TodoFgHACK', { fg = rose })
hl('TodoFgWARN', { fg = warn })
hl('TodoFgPERF', { fg = constants })
hl('TodoFgNOTE', { fg = info })
hl('TodoFgTEST', { fg = strings })

hl('TodoBgTODO', { fg = bg, bg = sage, bold = true })
hl('TodoBgFIXME', { fg = bg, bg = errors, bold = true })
hl('TodoBgHACK', { fg = bg, bg = rose, bold = true })
hl('TodoBgWARN', { fg = bg, bg = warn, bold = true })
hl('TodoBgPERF', { fg = bg, bg = constants, bold = true })
hl('TodoBgNOTE', { fg = bg, bg = info, bold = true })
hl('TodoBgTEST', { fg = bg, bg = strings, bold = true })

hl('TodoSignTODO', { fg = sage })
hl('TodoSignFIXME', { fg = errors })
hl('TodoSignHACK', { fg = rose })
hl('TodoSignWARN', { fg = warn })
hl('TodoSignPERF', { fg = constants })
hl('TodoSignNOTE', { fg = info })
hl('TodoSignTEST', { fg = strings })

-- ============================================================
-- 13. render-markdown
-- ============================================================
hl('RenderMarkdownH1', { fg = accent, bg = h1_bg, bold = true })
hl('RenderMarkdownH2', { fg = navy, bg = h2_bg, bold = true })
hl('RenderMarkdownH3', { fg = gold, bg = h3_bg, bold = true })
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
hl('RenderMarkdownLink', { fg = navy, underline = true })
hl('RenderMarkdownWikiLink', { fg = navy, underline = true })
hl('RenderMarkdownTableHead', { fg = accent, bold = true })
hl('RenderMarkdownTableRow', { fg = fg })
hl('RenderMarkdownTableFill', { fg = fg_muted })
hl('RenderMarkdownMath', { fg = constants })
hl('RenderMarkdownDash', { fg = bg_select })
hl('RenderMarkdownSign', { fg = fg_soft })
hl('RenderMarkdownUnchecked', { fg = fg_muted })
hl('RenderMarkdownChecked', { fg = diff_add })
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
hl('DropBarIconUiMenu', { fg = navy })
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
hl('DropBarKindFile', { fg = navy })
hl('DropBarKindFolder', { fg = navy })
hl('DropBarKindFunction', { fg = definitions })
hl('DropBarKindIdentifier', { fg = fg })
hl('DropBarKindIfStatement', { fg = fg })
hl('DropBarKindInterface', { fg = definitions })
hl('DropBarKindKeyword', { fg = fg })
hl('DropBarKindList', { fg = definitions })
hl('DropBarKindMacro', { fg = fg })
hl('DropBarKindMarkdownH1', { fg = accent, bold = true })
hl('DropBarKindMarkdownH2', { fg = navy, bold = true })
hl('DropBarKindMarkdownH3', { fg = gold, bold = true })
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
hl('DropBarKindReference', { fg = sage })
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
hl('HunkHeader', { fg = navy, bold = true })
