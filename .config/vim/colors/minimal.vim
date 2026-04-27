" minimal.vim - A quiet low-color dark colorscheme.

hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "minimal"

" Core UI
hi Normal       guifg=#e5e9f0 guibg=#282c34 ctermfg=254 ctermbg=236
hi NormalNC     guifg=#e5e9f0 guibg=#282c34 ctermfg=254 ctermbg=236
hi Cursor       guifg=#282c34 guibg=#e5e9f0 ctermfg=236 ctermbg=254
hi CursorLine   guibg=#303642 ctermbg=237
hi CursorColumn guibg=#303642 ctermbg=237
hi CursorLineNr guifg=#c0c8d4 guibg=#282c34 gui=bold ctermfg=252 ctermbg=236 cterm=bold
hi LineNr       guifg=#687386 guibg=#282c34 ctermfg=243 ctermbg=236
hi SignColumn   guifg=#9aa6b8 guibg=#282c34 ctermfg=246 ctermbg=236
hi ColorColumn  guibg=#303642 ctermbg=237
hi Visual       guibg=#3f4a5c ctermbg=60
hi VisualNOS    guibg=#3f4a5c ctermbg=60
hi Search       guifg=#282c34 guibg=#88a8c7 gui=bold ctermfg=236 ctermbg=110 cterm=bold
hi IncSearch    guifg=#282c34 guibg=#88a8c7 gui=bold ctermfg=236 ctermbg=110 cterm=bold
hi MatchParen   guifg=#e5e9f0 guibg=#384150 gui=bold ctermfg=254 ctermbg=238 cterm=bold
hi Pmenu        guifg=#e5e9f0 guibg=#23272f ctermfg=254 ctermbg=235
hi PmenuSel     guifg=#e5e9f0 guibg=#384150 ctermfg=254 ctermbg=238
hi PmenuSbar    guibg=#23272f ctermbg=235
hi PmenuThumb   guibg=#687386 ctermbg=243
hi StatusLine   guifg=#e5e9f0 guibg=#384150 ctermfg=254 ctermbg=238
hi StatusLineNC guifg=#9aa6b8 guibg=#23272f ctermfg=246 ctermbg=235
hi VertSplit    guifg=#3a4250 guibg=#282c34 ctermfg=238 ctermbg=236
hi WinSeparator guifg=#3a4250 guibg=#282c34 ctermfg=238 ctermbg=236
hi Folded       guifg=#9aa6b8 guibg=#23272f ctermfg=246 ctermbg=235
hi FoldColumn   guifg=#687386 guibg=#282c34 ctermfg=243 ctermbg=236
hi NonText      guifg=#687386 ctermfg=243
hi SpecialKey   guifg=#687386 ctermfg=243
hi EndOfBuffer  guifg=#282c34 ctermfg=236
hi Directory    guifg=#e5e9f0 gui=bold ctermfg=254 cterm=bold
hi Title        guifg=#e5e9f0 gui=bold ctermfg=254 cterm=bold
hi ErrorMsg     guifg=#c7777d ctermfg=174
hi WarningMsg   guifg=#c8ad72 ctermfg=179
hi ModeMsg      guifg=#e5e9f0 gui=bold ctermfg=254 cterm=bold
hi MoreMsg      guifg=#c0c8d4 ctermfg=252
hi Question     guifg=#c0c8d4 ctermfg=252
hi WildMenu     guifg=#e5e9f0 guibg=#384150 ctermfg=254 ctermbg=238

" Syntax: almost everything is plain foreground.
hi Comment        guifg=#a8bdd6 ctermfg=110
hi Constant       guifg=#e5e9f0 ctermfg=254
hi String         guifg=#e5e9f0 ctermfg=254
hi Character      guifg=#e5e9f0 ctermfg=254
hi Number         guifg=#e5e9f0 ctermfg=254
hi Boolean        guifg=#e5e9f0 ctermfg=254
hi Float          guifg=#e5e9f0 ctermfg=254
hi Identifier     guifg=#e5e9f0 ctermfg=254
hi Function       guifg=#e5e9f0 ctermfg=254
hi Statement      guifg=#e5e9f0 ctermfg=254
hi Conditional    guifg=#e5e9f0 ctermfg=254
hi Repeat         guifg=#e5e9f0 ctermfg=254
hi Label          guifg=#e5e9f0 ctermfg=254
hi Operator       guifg=#e5e9f0 ctermfg=254
hi Keyword        guifg=#e5e9f0 ctermfg=254
hi Exception      guifg=#e5e9f0 ctermfg=254
hi PreProc        guifg=#e5e9f0 ctermfg=254
hi Include        guifg=#e5e9f0 ctermfg=254
hi Define         guifg=#e5e9f0 ctermfg=254
hi Macro          guifg=#e5e9f0 ctermfg=254
hi PreCondit      guifg=#e5e9f0 ctermfg=254
hi Type           guifg=#e5e9f0 ctermfg=254
hi StorageClass   guifg=#e5e9f0 ctermfg=254
hi Structure      guifg=#e5e9f0 ctermfg=254
hi Typedef        guifg=#e5e9f0 ctermfg=254
hi Special        guifg=#e5e9f0 ctermfg=254
hi SpecialChar    guifg=#e5e9f0 ctermfg=254
hi Tag            guifg=#e5e9f0 ctermfg=254
hi Delimiter      guifg=#e5e9f0 ctermfg=254
hi SpecialComment guifg=#a8bdd6 ctermfg=110
hi Debug          guifg=#e5e9f0 ctermfg=254
hi Underlined     guifg=#e5e9f0 gui=underline ctermfg=254 cterm=underline
hi Ignore         guifg=#687386 ctermfg=243
hi Error          guifg=#c7777d ctermfg=174
hi Todo           guifg=#e5e9f0 guibg=#384150 gui=bold ctermfg=254 ctermbg=238 cterm=bold

" Diagnostics and diffs
hi SpellBad      gui=undercurl guisp=#c7777d cterm=underline
hi SpellCap      gui=undercurl guisp=#c8ad72 cterm=underline
hi SpellRare     gui=undercurl guisp=#88a8c7 cterm=underline
hi SpellLocal    gui=undercurl guisp=#88a8c7 cterm=underline
hi DiffAdd       guifg=#9ab083 guibg=#303a35 ctermfg=108 ctermbg=236
hi DiffDelete    guifg=#c7777d guibg=#3a3035 ctermfg=174 ctermbg=236
hi DiffChange    guifg=#c0c8d4 guibg=#303642 ctermfg=252 ctermbg=237
hi DiffText      guifg=#e5e9f0 guibg=#3b463f ctermfg=254 ctermbg=238
hi Added         guifg=#9ab083 ctermfg=108
hi Removed       guifg=#c7777d ctermfg=174
hi Changed       guifg=#c0c8d4 ctermfg=252
