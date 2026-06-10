" tri_dim_teal.vim – dim, minimal dark colorscheme
" Rewrite of tri_dim with a muted teal/stone palette

hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "tri_dim_teal"

" Palette reference:
" bg          = #162122   (normal.black / primary.background)
" bg_1        = #1e2d2f   (slightly lifted surface)
" bg_2        = #243335   (popup / selection bg)
" bg_sel      = #2e3f42   (active selection)
" fg          = #D4D5D0   (primary.foreground / bright.yellow)
" fg_dim      = #BBBCB8   (normal.white)
" grey        = #4D7179   (normal.blue – muted teal for dimmed chrome)
" teal_bright = #8AABB2   (bright.blue / bright.magenta / cursor)
" teal_mid    = #7A9DA5   (normal.cyan)
" green       = #7FA896   (bright.green)
" green_dim   = #4A6B56   (normal.green)
" stone       = #9E9884   (normal.yellow)
" stone_dim   = #7A6E5F   (normal.red)
" white       = #EEEEED   (bright.white)
" cyan        = #C8CCC8   (bright.cyan)
" red_err     = #A8A090   (bright.red – kept soft, no harsh reds in palette)

" -------------------------------------------------------------------
" UI
" -------------------------------------------------------------------
hi Normal       guifg=#D4D5D0 guibg=#162122

" Cursor / current line
hi Cursor       guifg=#162122 guibg=#8AABB2
hi CursorColumn guibg=#162122
hi CursorLine   guibg=#1e2d2f guifg=NONE    cterm=NONE term=NONE

" Line numbers
hi LineNr       guifg=#4D7179 guibg=#162122
hi CursorLineNr guifg=#8AABB2 guibg=#1e2d2f cterm=NONE term=NONE gui=NONE

" Status line
hi StatusLine   guifg=#4D7179 guibg=#162122
hi StatusLineNC guifg=#4D7179 guibg=#162122

" Splits / gutter / columns
hi VertSplit    guifg=#1e2d2f guibg=#162122
hi SignColumn   guifg=#4D7179 guibg=#162122
hi ColorColumn  guibg=#1e2d2f

" Popup menu
hi Pmenu        guifg=#D4D5D0 guibg=#1e2d2f
hi PmenuSel     guifg=#EEEEED guibg=#2e3f42
hi PmenuSbar    guibg=#243335
hi PmenuThumb   guibg=#8AABB2

" Non-text / EOF
hi NonText      guifg=#1e2d2f guibg=#162122
hi SpecialKey   guifg=#1e2d2f
hi EndOfBuffer  guifg=#162122 guibg=#162122

" Visual selection
hi Visual       guifg=NONE    guibg=#243335

" Search
hi Search       guifg=#D4D5D0 guibg=#2e3f42
hi IncSearch    guifg=#162122 guibg=#8AABB2

" -------------------------------------------------------------------
" Minimal syntax
" -------------------------------------------------------------------

hi Comment      guifg=#4D7179 gui=italic cterm=italic

" Keywords / control flow → warm stone
hi Keyword      guifg=#9E9884 gui=NONE
hi Conditional  guifg=#9E9884 gui=NONE
hi Repeat       guifg=#9E9884 gui=NONE
hi Statement    guifg=#9E9884 gui=NONE

" Identifiers / types → teal
hi Identifier   guifg=#7A9DA5
hi Function     guifg=#8AABB2 gui=NONE
hi Type         guifg=#7A9DA5 gui=NONE
hi StorageClass guifg=#7A9DA5
hi Structure    guifg=#7A9DA5

" Strings → muted green
hi String       guifg=#7FA896
hi Character    guifg=#7FA896

" Constants / numbers → soft cyan/stone
hi Constant     guifg=#C8CCC8
hi Number       guifg=#C8CCC8
hi Boolean      guifg=#C8CCC8

" Preprocessor / includes
hi PreProc      guifg=#7A9DA5
hi Include      guifg=#7A9DA5

hi Operator     guifg=#D4D5D0

" -------------------------------------------------------------------
" Diagnostics / misc
" -------------------------------------------------------------------
hi Error        guifg=#A8A090 guibg=NONE gui=bold
hi ErrorMsg     guifg=#A8A090 guibg=NONE gui=bold
hi WarningMsg   guifg=#9E9884 guibg=NONE

hi DiagnosticError guifg=#A8A090 guibg=NONE
hi DiagnosticWarn  guifg=#9E9884 guibg=NONE
hi DiagnosticInfo  guifg=#8AABB2 guibg=NONE
hi DiagnosticHint  guifg=#4D7179 guibg=NONE

hi DiagnosticUnderlineError gui=undercurl guisp=#A8A090
hi DiagnosticUnderlineWarn  gui=undercurl guisp=#9E9884
hi DiagnosticUnderlineInfo  gui=undercurl guisp=#8AABB2
hi DiagnosticUnderlineHint  gui=undercurl guisp=#4D7179

" Legacy LSP group names
hi link LspDiagnosticsDefaultError       DiagnosticError
hi link LspDiagnosticsDefaultWarning     DiagnosticWarn
hi link LspDiagnosticsDefaultInformation DiagnosticInfo
hi link LspDiagnosticsDefaultHint        DiagnosticHint
hi link LspDiagnosticsUnderlineError     DiagnosticUnderlineError
hi link LspDiagnosticsUnderlineWarning   DiagnosticUnderlineWarn
hi link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
hi link LspDiagnosticsUnderlineHint      DiagnosticUnderlineHint

" ALE
hi ALEErrorSign   guifg=#A8A090 guibg=NONE gui=bold
hi ALEWarningSign guifg=#9E9884 guibg=NONE gui=bold
hi ALEInfoSign    guifg=#8AABB2 guibg=NONE gui=bold
hi ALEErrorLine   guibg=#1e2d2f
hi ALEWarningLine guibg=#1e2d2f
hi ALEError       guifg=#A8A090 guibg=NONE
hi ALEWarning     guifg=#9E9884 guibg=NONE

" Spelling
hi SpellBad   gui=undercurl guisp=#A8A090
hi SpellCap   gui=undercurl guisp=#9E9884
hi SpellRare  gui=undercurl guisp=#8AABB2
hi SpellLocal gui=undercurl guisp=#4D7179

hi Todo       guifg=#162122 guibg=#7FA896
hi MatchParen guifg=#162122 guibg=#8AABB2
hi ExtraWhitespace guibg=#1e2d2f

" -------------------------------------------------------------------
" Dynamic cursor (matches syntax color under cursor)
" Set: let g:tri_dim_teal_dynamic_cursor = 0  to disable
" -------------------------------------------------------------------
if get(g:, 'tri_dim_teal_dynamic_cursor', 1)
  function! s:TriDimTealUpdateCursor() abort
    let l:id = synID(line('.'), col('.'), 1)
    let l:id = synIDtrans(l:id)

    let l:fg = synIDattr(l:id, 'fg#')
    let l:bg = synIDattr(l:id, 'bg#')

    if empty(l:fg)
      let l:fg = synIDattr(hlID('Normal'), 'fg#')
    endif
    if empty(l:bg)
      let l:bg = synIDattr(hlID('Normal'), 'bg#')
    endif

    execute 'hi Cursor  guifg=' . l:bg . ' guibg=' . l:fg
    execute 'hi iCursor guifg=' . l:bg . ' guibg=' . l:fg
  endfunction

  augroup TriDimTealDynamicCursor
    autocmd!
    autocmd CursorMoved,CursorMovedI * call s:TriDimTealUpdateCursor()
  augroup END
endif
