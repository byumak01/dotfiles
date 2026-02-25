-- minimal.lua — A minimal Neovim colorscheme
-- Inspired by VSCode Dark's background and comment colors
-- Philosophy: let the code speak for itself, highlight only what matters

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "minimal"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Palette ──────────────────────────────────────────────
local bg        = "#1e1e1e"  -- VSCode dark background
local bg_light  = "#252526"  -- Slightly lighter bg (cursorline, statusline)
local bg_sel    = "#264f78"  -- Selection / visual
local bg_float  = "#2d2d2d"  -- Floating windows, popups
local fg        = "#d4d4d4"  -- Default foreground
local fg_dim    = "#808080"  -- Line numbers, inactive text
local comment   = "#6a9955"  -- VSCode green comments
local accent    = "#569cd6"  -- Keywords, class/type names — soft blue
local accent2   = "#c586c0"  -- Control flow, template/return type — muted purple
local string_fg = "#ce9178"  -- Strings get a subtle warm tone (optional, remove if too much)
local error_fg  = "#f44747"
local warn_fg   = "#cca700"
local info_fg   = "#3794ff"
local hint_fg   = "#6a9955"
local diff_add  = "#2d3b2d"
local diff_del  = "#3b2d2d"
local diff_chg  = "#2d3548"

-- ── Editor chrome ────────────────────────────────────────
hi("Normal",         { fg = fg, bg = bg })
hi("NormalFloat",    { fg = fg, bg = bg_float })
hi("FloatBorder",    { fg = fg_dim, bg = bg_float })
hi("CursorLine",     { bg = bg_light })
hi("CursorLineNr",   { fg = fg, bold = true })
hi("LineNr",         { fg = fg_dim })
hi("SignColumn",     { bg = bg })
hi("ColorColumn",    { bg = bg_light })
hi("Visual",         { bg = bg_sel })
hi("VisualNOS",      { bg = bg_sel })
hi("Search",         { fg = fg, bg = "#613214" })
hi("IncSearch",      { fg = bg, bg = warn_fg })
hi("CurSearch",      { fg = bg, bg = warn_fg })
hi("MatchParen",     { fg = fg, bold = true, underline = true })
hi("Pmenu",          { fg = fg, bg = bg_float })
hi("PmenuSel",       { fg = fg, bg = bg_sel })
hi("PmenuSbar",      { bg = bg_float })
hi("PmenuThumb",     { bg = fg_dim })
hi("StatusLine",     { fg = fg, bg = bg_light })
hi("StatusLineNC",   { fg = fg_dim, bg = bg_light })
hi("TabLine",        { fg = fg_dim, bg = bg_light })
hi("TabLineSel",     { fg = fg, bg = bg })
hi("TabLineFill",    { bg = bg_light })
hi("WinSeparator",   { fg = "#333333" })
hi("VertSplit",      { fg = "#333333" })
hi("Folded",         { fg = fg_dim, bg = bg_light })
hi("FoldColumn",     { fg = fg_dim, bg = bg })
hi("NonText",        { fg = "#333333" })
hi("SpecialKey",     { fg = "#333333" })
hi("EndOfBuffer",    { fg = bg })
hi("Directory",      { fg = accent })
hi("Title",          { fg = fg, bold = true })
hi("ErrorMsg",       { fg = error_fg })
hi("WarningMsg",     { fg = warn_fg })
hi("ModeMsg",        { fg = fg, bold = true })
hi("MoreMsg",        { fg = accent })
hi("Question",       { fg = accent })
hi("WildMenu",       { fg = fg, bg = bg_sel })

-- ── Syntax — THE MINIMAL PART ───────────────────────────
-- Almost everything is just plain foreground.
hi("Comment",        { fg = comment, italic = true })

-- These all just look like normal text:
hi("Constant",       { fg = fg })
hi("Number",         { fg = fg })
hi("Boolean",        { fg = fg })
hi("Float",          { fg = fg })
hi("Character",      { fg = fg })
hi("String",         { fg = string_fg })      -- subtle warmth so strings are scannable
hi("Identifier",     { fg = fg })
hi("Function",       { fg = fg })
hi("Operator",       { fg = fg })
hi("Delimiter",      { fg = fg })
hi("Special",        { fg = fg })
hi("SpecialChar",    { fg = fg })
hi("Tag",            { fg = fg })

-- The few things that DO get color:
hi("Statement",      { fg = fg })             -- most statements: plain
hi("Keyword",        { fg = accent })          -- class, struct, fn, def, etc.
hi("Conditional",    { fg = accent })         -- if, else, switch
hi("Repeat",         { fg = accent })         -- for, while, loop
hi("Exception",      { fg = accent })         -- try, catch, throw
hi("Type",           { fg = accent })           -- type names, class names
hi("StorageClass",   { fg = accent })           -- static, extern, template
hi("Structure",      { fg = accent })           -- struct, union, enum
hi("Typedef",        { fg = accent })
hi("PreProc",        { fg = fg_dim })           -- preprocessor: dim, not distracting
hi("Include",        { fg = fg_dim })           -- #include, import
hi("Define",         { fg = fg_dim })
hi("Macro",          { fg = fg_dim })

-- ── Treesitter overrides (if available) ──────────────────
-- Same philosophy: almost everything inherits Normal (plain fg).
-- Only type/class definitions and control flow get color.
hi("@variable",              { fg = fg })
hi("@variable.builtin",      { fg = fg })
hi("@variable.parameter",    { fg = fg })
hi("@variable.member",       { fg = fg })
hi("@constant",              { fg = fg })
hi("@constant.builtin",      { fg = fg })
hi("@module",                { fg = fg })
hi("@string",                { fg = string_fg })
hi("@string.escape",         { fg = string_fg })
hi("@string.regex",          { fg = string_fg })
hi("@character",             { fg = fg })
hi("@number",                { fg = fg })
hi("@boolean",               { fg = fg })
hi("@float",                 { fg = fg })
hi("@function",              { fg = fg })
hi("@function.builtin",      { fg = fg })
hi("@function.call",         { fg = fg })
hi("@function.method",       { fg = fg })
hi("@function.method.call",  { fg = fg })
hi("@constructor",           { fg = accent })    -- class constructors get accent
hi("@operator",              { fg = fg })
hi("@keyword",               { fg = accent })
hi("@keyword.function",      { fg = accent })     -- fn, def, func
hi("@keyword.operator",      { fg = fg })
hi("@keyword.return",        { fg = accent })    -- return stands out slightly
hi("@keyword.import",        { fg = fg_dim })
hi("@keyword.conditional",   { fg = accent })
hi("@keyword.repeat",        { fg = accent })
hi("@keyword.exception",     { fg = accent })
hi("@type",                  { fg = accent })
hi("@type.builtin",          { fg = accent })
hi("@type.definition",       { fg = accent })
hi("@type.qualifier",        { fg = accent })
hi("@attribute",             { fg = fg_dim })
hi("@property",              { fg = fg })
hi("@tag",                   { fg = fg })
hi("@tag.attribute",         { fg = fg })
hi("@tag.delimiter",         { fg = fg })
hi("@punctuation",           { fg = fg })
hi("@punctuation.bracket",   { fg = fg })
hi("@punctuation.delimiter", { fg = fg })
hi("@punctuation.special",   { fg = fg })
hi("@comment",               { fg = comment, italic = true })
hi("@markup.heading",        { fg = fg, bold = true })
hi("@markup.raw",            { fg = string_fg })
hi("@markup.link",           { fg = accent, underline = true })
hi("@markup.link.url",       { fg = accent, underline = true })
hi("@markup.list",           { fg = fg })

-- ── LSP Semantic tokens (flatten most of them) ──────────
hi("@lsp.type.variable",     { fg = fg })
hi("@lsp.type.parameter",    { fg = fg })
hi("@lsp.type.property",     { fg = fg })
hi("@lsp.type.function",     { fg = fg })
hi("@lsp.type.method",       { fg = fg })
hi("@lsp.type.namespace",    { fg = fg })
hi("@lsp.type.enum",         { fg = accent })
hi("@lsp.type.type",         { fg = accent })
hi("@lsp.type.class",        { fg = accent })
hi("@lsp.type.struct",       { fg = accent })
hi("@lsp.type.interface",    { fg = accent })
hi("@lsp.type.typeParameter",{ fg = accent })     -- template params
hi("@lsp.type.decorator",    { fg = fg_dim })
hi("@lsp.type.macro",        { fg = fg_dim })

-- ── Diagnostics ──────────────────────────────────────────
hi("DiagnosticError",          { fg = error_fg })
hi("DiagnosticWarn",           { fg = warn_fg })
hi("DiagnosticInfo",           { fg = info_fg })
hi("DiagnosticHint",           { fg = hint_fg })
hi("DiagnosticUnderlineError", { sp = error_fg, undercurl = true })
hi("DiagnosticUnderlineWarn",  { sp = warn_fg, undercurl = true })
hi("DiagnosticUnderlineInfo",  { sp = info_fg, undercurl = true })
hi("DiagnosticUnderlineHint",  { sp = hint_fg, undercurl = true })

-- ── Git / Diff ───────────────────────────────────────────
hi("DiffAdd",    { bg = diff_add })
hi("DiffDelete", { bg = diff_del })
hi("DiffChange", { bg = diff_chg })
hi("DiffText",   { bg = "#3a4a5e" })
hi("Added",      { fg = "#6a9955" })
hi("Removed",    { fg = error_fg })
hi("Changed",    { fg = accent })

-- ── GitSigns (if installed) ──────────────────────────────
hi("GitSignsAdd",    { fg = "#6a9955" })
hi("GitSignsChange", { fg = accent })
hi("GitSignsDelete", { fg = error_fg })

-- ── Telescope (if installed) ─────────────────────────────
hi("TelescopeBorder",       { fg = fg_dim, bg = bg })
hi("TelescopePromptBorder", { fg = fg_dim, bg = bg })
hi("TelescopeResultsBorder",{ fg = fg_dim, bg = bg })
hi("TelescopePreviewBorder",{ fg = fg_dim, bg = bg })
hi("TelescopeSelection",    { bg = bg_sel })
hi("TelescopeMatching",     { fg = warn_fg, bold = true })

-- ── Indent guides (indent-blankline etc.) ────────────────
hi("IblIndent",  { fg = "#2d2d2d" })
hi("IblScope",   { fg = "#444444" })
