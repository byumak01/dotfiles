-- minimal.lua - A quiet low-color dark colorscheme.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "minimal"

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local bg = "#282c34"
local bg_alt = "#23272f"
local bg_hl = "#303642"
local bg_active = "#384150"
local bg_region = "#3f4a5c"
local fg = "#e5e9f0"
local fg_dim = "#c0c8d4"
local fg_muted = "#9aa6b8"
local fg_faint = "#687386"
local border = "#3a4250"
local comment = "#a8bdd6"
local accent = "#88a8c7"
local red = "#c7777d"
local green = "#9ab083"
local yellow = "#c8ad72"
local diff_added_bg = "#303a35"
local diff_removed_bg = "#3a3035"
local diff_changed_bg = "#303642"
local diff_refine_added_bg = "#3b463f"
local diff_refine_removed_bg = "#49393e"

-- Editor chrome
hi("Normal", { fg = fg, bg = bg })
hi("NormalNC", { fg = fg, bg = bg })
hi("NormalFloat", { fg = fg, bg = bg_alt })
hi("FloatBorder", { fg = border, bg = bg_alt })
hi("FloatTitle", { fg = fg, bg = bg_alt, bold = true })
hi("Cursor", { fg = bg, bg = fg })
hi("CursorLine", { bg = bg_hl })
hi("CursorColumn", { bg = bg_hl })
hi("CursorLineNr", { fg = fg_dim, bg = bg, bold = true })
hi("LineNr", { fg = fg_faint, bg = bg })
hi("SignColumn", { fg = fg_muted, bg = bg })
hi("ColorColumn", { bg = bg_hl })
hi("Visual", { bg = bg_region })
hi("VisualNOS", { bg = bg_region })
hi("Search", { fg = bg, bg = accent, bold = true })
hi("IncSearch", { fg = bg, bg = accent, bold = true })
hi("CurSearch", { fg = bg, bg = accent, bold = true })
hi("Substitute", { fg = bg, bg = yellow })
hi("MatchParen", { fg = fg, bg = bg_active, bold = true })
hi("Pmenu", { fg = fg, bg = bg_alt })
hi("PmenuSel", { fg = fg, bg = bg_active })
hi("PmenuSbar", { bg = bg_alt })
hi("PmenuThumb", { bg = fg_faint })
hi("StatusLine", { fg = fg, bg = bg_active })
hi("StatusLineNC", { fg = fg_muted, bg = bg_alt })
hi("TabLine", { fg = fg_muted, bg = bg_alt })
hi("TabLineSel", { fg = fg, bg = bg })
hi("TabLineFill", { bg = bg_alt })
hi("WinSeparator", { fg = border, bg = bg })
hi("VertSplit", { fg = border, bg = bg })
hi("Folded", { fg = fg_muted, bg = bg_alt })
hi("FoldColumn", { fg = fg_faint, bg = bg })
hi("NonText", { fg = fg_faint })
hi("SpecialKey", { fg = fg_faint })
hi("EndOfBuffer", { fg = bg })
hi("Directory", { fg = fg, bold = true })
hi("Title", { fg = fg, bold = true })
hi("ErrorMsg", { fg = red })
hi("WarningMsg", { fg = yellow })
hi("ModeMsg", { fg = fg, bold = true })
hi("MoreMsg", { fg = fg_dim })
hi("Question", { fg = fg_dim })
hi("WildMenu", { fg = fg, bg = bg_active })

-- Syntax: intentionally almost monochrome.
hi("Comment", { fg = comment })
hi("Constant", { fg = fg })
hi("String", { fg = fg })
hi("Character", { fg = fg })
hi("Number", { fg = fg })
hi("Boolean", { fg = fg })
hi("Float", { fg = fg })
hi("Identifier", { fg = fg })
hi("Function", { fg = fg })
hi("Statement", { fg = fg })
hi("Conditional", { fg = fg })
hi("Repeat", { fg = fg })
hi("Label", { fg = fg })
hi("Operator", { fg = fg })
hi("Keyword", { fg = fg })
hi("Exception", { fg = fg })
hi("PreProc", { fg = fg })
hi("Include", { fg = fg })
hi("Define", { fg = fg })
hi("Macro", { fg = fg })
hi("PreCondit", { fg = fg })
hi("Type", { fg = fg })
hi("StorageClass", { fg = fg })
hi("Structure", { fg = fg })
hi("Typedef", { fg = fg })
hi("Special", { fg = fg })
hi("SpecialChar", { fg = fg })
hi("Tag", { fg = fg })
hi("Delimiter", { fg = fg })
hi("SpecialComment", { fg = comment })
hi("Debug", { fg = fg })
hi("Underlined", { fg = fg, underline = true })
hi("Ignore", { fg = fg_faint })
hi("Error", { fg = red })
hi("Todo", { fg = fg, bg = bg_active, bold = true })

-- Treesitter
hi("@comment", { fg = comment })
hi("@string", { fg = fg })
hi("@string.escape", { fg = fg })
hi("@string.regex", { fg = fg })
hi("@character", { fg = fg })
hi("@number", { fg = fg })
hi("@boolean", { fg = fg })
hi("@float", { fg = fg })
hi("@constant", { fg = fg })
hi("@constant.builtin", { fg = fg })
hi("@variable", { fg = fg })
hi("@variable.builtin", { fg = fg })
hi("@variable.parameter", { fg = fg })
hi("@variable.member", { fg = fg })
hi("@property", { fg = fg })
hi("@module", { fg = fg })
hi("@function", { fg = fg })
hi("@function.builtin", { fg = fg })
hi("@function.call", { fg = fg })
hi("@function.method", { fg = fg })
hi("@function.method.call", { fg = fg })
hi("@constructor", { fg = fg })
hi("@operator", { fg = fg })
hi("@keyword", { fg = fg })
hi("@keyword.function", { fg = fg })
hi("@keyword.operator", { fg = fg })
hi("@keyword.return", { fg = fg })
hi("@keyword.import", { fg = fg })
hi("@keyword.conditional", { fg = fg })
hi("@keyword.repeat", { fg = fg })
hi("@keyword.exception", { fg = fg })
hi("@type", { fg = fg })
hi("@type.builtin", { fg = fg })
hi("@type.definition", { fg = fg })
hi("@type.qualifier", { fg = fg })
hi("@attribute", { fg = fg })
hi("@tag", { fg = fg })
hi("@tag.attribute", { fg = fg })
hi("@tag.delimiter", { fg = fg })
hi("@punctuation", { fg = fg })
hi("@punctuation.bracket", { fg = fg })
hi("@punctuation.delimiter", { fg = fg })
hi("@punctuation.special", { fg = fg })
hi("@markup.heading", { fg = fg, bold = true })
hi("@markup.raw", { fg = fg_dim })
hi("@markup.link", { fg = fg, underline = true })
hi("@markup.link.url", { fg = fg_dim, underline = true })
hi("@markup.list", { fg = fg })

-- LSP semantic tokens
hi("@lsp.type.variable", { fg = fg })
hi("@lsp.type.parameter", { fg = fg })
hi("@lsp.type.property", { fg = fg })
hi("@lsp.type.function", { fg = fg })
hi("@lsp.type.method", { fg = fg })
hi("@lsp.type.namespace", { fg = fg })
hi("@lsp.type.enum", { fg = fg })
hi("@lsp.type.type", { fg = fg })
hi("@lsp.type.class", { fg = fg })
hi("@lsp.type.struct", { fg = fg })
hi("@lsp.type.interface", { fg = fg })
hi("@lsp.type.typeParameter", { fg = fg })
hi("@lsp.type.decorator", { fg = fg })
hi("@lsp.type.macro", { fg = fg })

-- Diagnostics
hi("DiagnosticError", { fg = red })
hi("DiagnosticWarn", { fg = yellow })
hi("DiagnosticInfo", { fg = accent })
hi("DiagnosticHint", { fg = fg_muted })
hi("DiagnosticUnderlineError", { sp = red, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = yellow, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = accent, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = fg_muted, undercurl = true })

-- Git / diff
hi("DiffAdd", { fg = green, bg = diff_added_bg })
hi("DiffDelete", { fg = red, bg = diff_removed_bg })
hi("DiffChange", { fg = fg_dim, bg = diff_changed_bg })
hi("DiffText", { fg = fg, bg = diff_refine_added_bg })
hi("Added", { fg = green })
hi("Removed", { fg = red })
hi("Changed", { fg = fg_dim })
hi("GitSignsAdd", { fg = green })
hi("GitSignsChange", { fg = fg_dim })
hi("GitSignsDelete", { fg = red })

-- Common plugins
hi("TelescopeBorder", { fg = border, bg = bg })
hi("TelescopePromptBorder", { fg = border, bg = bg })
hi("TelescopeResultsBorder", { fg = border, bg = bg })
hi("TelescopePreviewBorder", { fg = border, bg = bg })
hi("TelescopeSelection", { fg = fg, bg = bg_active })
hi("TelescopeMatching", { fg = fg, bold = true })
hi("NvimTreeNormal", { fg = fg, bg = bg })
hi("NvimTreeFolderName", { fg = fg })
hi("NvimTreeOpenedFolderName", { fg = fg, bold = true })
hi("NvimTreeRootFolder", { fg = fg, bold = true })
hi("NvimTreeGitDirty", { fg = fg_dim })
hi("NvimTreeGitNew", { fg = green })
hi("NvimTreeGitDeleted", { fg = red })
hi("WhichKey", { fg = fg, bold = true })
hi("WhichKeyGroup", { fg = fg_dim })
hi("WhichKeyDesc", { fg = fg })
hi("IblIndent", { fg = border })
hi("IblScope", { fg = fg_faint })
