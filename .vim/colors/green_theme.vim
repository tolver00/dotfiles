" -----------------------------------------------------------------------------
" File: green_theme.vim
" Description: Greybird-dark palette applied to a Gruvbox-style structure
" Palette sourced from: greybird-dark-theme.el
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='greybird'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:greybird_bold')
  let g:greybird_bold=1
endif
if !exists('g:greybird_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:greybird_italic=1
  else
    let g:greybird_italic=0
  endif
endif
if !exists('g:greybird_undercurl')
  let g:greybird_undercurl=1
endif
if !exists('g:greybird_underline')
  let g:greybird_underline=1
endif
if !exists('g:greybird_inverse')
  let g:greybird_inverse=1
endif

if !exists('g:greybird_guisp_fallback') || index(['fg', 'bg'], g:greybird_guisp_fallback) == -1
  let g:greybird_guisp_fallback='NONE'
endif

if !exists('g:greybird_improved_strings')
  let g:greybird_improved_strings=0
endif

if !exists('g:greybird_improved_warnings')
  let g:greybird_improved_warnings=0
endif

if !exists('g:greybird_termcolors')
  let g:greybird_termcolors=256
endif

if !exists('g:greybird_invert_indent_guides')
  let g:greybird_invert_indent_guides=0
endif

if !exists('g:greybird_contrast_dark')
  let g:greybird_contrast_dark='medium'
endif

if !exists('g:greybird_contrast_light')
  let g:greybird_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" Backgrounds — stepped from darkest to lightest
let s:gb.dark0_hard  = ['#162122', 235]   " primary.background
let s:gb.dark0       = ['#162122', 235]   " primary.background
let s:gb.dark0_soft  = ['#1d2829', 236]   " lifted bg
let s:gb.dark1       = ['#1d2829', 236]   " modeline, sidebars
let s:gb.dark2       = ['#243132', 237]   " hl-line, tooltips
let s:gb.dark3       = ['#304537', 65]    " selection (green-tinged)
let s:gb.dark4       = ['#2e3c3e', 238]   " panel borders

let s:gb.gray_245    = ['#6b8486', 66]    " bright.black — comments, line-numbers
let s:gb.gray_244    = ['#6b8486', 66]

" Foregrounds — stepped from brightest to dimmest
let s:gb.light0_hard = ['#d4d5d0', 188]   " primary.foreground
let s:gb.light0      = ['#d4d5d0', 188]
let s:gb.light0_soft = ['#d4d5d0', 188]
let s:gb.light1      = ['#bbbcb8', 250]   " identifiers, dimmer text
let s:gb.light2      = ['#9ea09b', 247]
let s:gb.light3      = ['#8a8c88', 245]
let s:gb.light4      = ['#6b8486', 66]    " muted

" Accent colours
let s:gb.bright_red     = ['#c08878', 174]  " errors, warnings
let s:gb.bright_green   = ['#88c8a8', 115]  " strings
let s:gb.bright_yellow  = ['#c8b47c', 179]  " types, doc-strings
let s:gb.bright_blue    = ['#9dccd4', 116]  " keywords, prompts
let s:gb.bright_purple  = ['#a898c4', 140]  " constants, numbers
let s:gb.bright_aqua    = ['#7ec0cc', 109]  " functions, builtins
let s:gb.bright_orange  = ['#d4a574', 179]  " warm amber accent

let s:gb.neutral_red    = ['#c08878', 174]
let s:gb.neutral_green  = ['#88c8a8', 115]
let s:gb.neutral_yellow = ['#c8b47c', 179]
let s:gb.neutral_blue   = ['#9dccd4', 116]
let s:gb.neutral_purple = ['#a898c4', 140]
let s:gb.neutral_aqua   = ['#7ec0cc', 109]
let s:gb.neutral_orange = ['#d4a574', 179]

let s:gb.faded_red      = ['#b07060', 131]
let s:gb.faded_green    = ['#6aaa8a', 72]
let s:gb.faded_yellow   = ['#b09a62', 136]
let s:gb.faded_blue     = ['#7aacb4', 73]
let s:gb.faded_purple   = ['#8878aa', 97]
let s:gb.faded_aqua     = ['#5ea0ac', 67]
let s:gb.faded_orange   = ['#b48054', 130]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:greybird_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:greybird_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:greybird_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:greybird_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:greybird_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:greybird_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:greybird_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:greybird_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:greybird_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:greybird_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:greybird_hls_cursor')
  let s:hls_cursor = get(s:gb, g:greybird_hls_cursor)
endif

let s:number_column = s:none
if exists('g:greybird_number_column')
  let s:number_column = get(s:gb, g:greybird_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:greybird_sign_column')
    let s:sign_column = get(s:gb, g:greybird_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:greybird_color_column')
  let s:color_column = get(s:gb, g:greybird_color_column)
endif

let s:vert_split = s:bg0
if exists('g:greybird_vert_split')
  let s:vert_split = get(s:gb, g:greybird_vert_split)
endif

let s:invert_signs = ''
if exists('g:greybird_invert_signs')
  if g:greybird_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:greybird_invert_selection')
  if g:greybird_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:greybird_invert_tabline')
  if g:greybird_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:greybird_italicize_comments')
  if g:greybird_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:greybird_italicize_strings')
  if g:greybird_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:greybird_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert highlighting
    if g:greybird_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Greybird Hi Groups: {{{

" memoize common hi groups
call s:HL('GreybirdFg0', s:fg0)
call s:HL('GreybirdFg1', s:fg1)
call s:HL('GreybirdFg2', s:fg2)
call s:HL('GreybirdFg3', s:fg3)
call s:HL('GreybirdFg4', s:fg4)
call s:HL('GreybirdGray', s:gray)
call s:HL('GreybirdBg0', s:bg0)
call s:HL('GreybirdBg1', s:bg1)
call s:HL('GreybirdBg2', s:bg2)
call s:HL('GreybirdBg3', s:bg3)
call s:HL('GreybirdBg4', s:bg4)

call s:HL('GreybirdRed', s:red)
call s:HL('GreybirdRedBold', s:red, s:none, s:bold)
call s:HL('GreybirdGreen', s:green)
call s:HL('GreybirdGreenBold', s:green, s:none, s:bold)
call s:HL('GreybirdYellow', s:yellow)
call s:HL('GreybirdYellowBold', s:yellow, s:none, s:bold)
call s:HL('GreybirdBlue', s:blue)
call s:HL('GreybirdBlueBold', s:blue, s:none, s:bold)
call s:HL('GreybirdPurple', s:purple)
call s:HL('GreybirdPurpleBold', s:purple, s:none, s:bold)
call s:HL('GreybirdAqua', s:aqua)
call s:HL('GreybirdAquaBold', s:aqua, s:none, s:bold)
call s:HL('GreybirdOrange', s:orange)
call s:HL('GreybirdOrangeBold', s:orange, s:none, s:bold)

call s:HL('GreybirdRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GreybirdGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GreybirdYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GreybirdBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GreybirdPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GreybirdAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('GreybirdOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText GreybirdBg2
hi! link SpecialKey GreybirdBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory GreybirdGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title GreybirdGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg GreybirdYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg GreybirdYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question GreybirdOrangeBold
" Warning messages
hi! link WarningMsg GreybirdRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input mode cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:greybird_improved_strings == 0
  hi! link Special GreybirdOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GreybirdBlue
" if, then, else, endif, switch, etc.
hi! link Conditional GreybirdBlue
" for, do, while, etc.
hi! link Repeat GreybirdBlue
" case, default, etc.
hi! link Label GreybirdBlue
" try, catch, throw
hi! link Exception GreybirdRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword GreybirdBlue

" Variable name
hi! link Identifier GreybirdFg1
" Function name
hi! link Function GreybirdAquaBold

" Generic preprocessor
hi! link PreProc GreybirdAqua
" Preprocessor #include
hi! link Include GreybirdAqua
" Preprocessor #define
hi! link Define GreybirdAqua
" Same as Define
hi! link Macro GreybirdAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GreybirdAqua

" Generic constant
hi! link Constant GreybirdPurple
" Character constant: 'c', '\n'
hi! link Character GreybirdPurple
" String constant: "this is a string"
if g:greybird_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean GreybirdPurple
" Number constant: 234, 0xff
hi! link Number GreybirdPurple
" Floating point constant: 2.3e10
hi! link Float GreybirdPurple

" Generic type
hi! link Type GreybirdYellow
" static, register, volatile, etc
hi! link StorageClass GreybirdOrange
" struct, union, enum, etc.
hi! link Structure GreybirdAqua
" typedef
hi! link Typedef GreybirdYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:greybird_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:greybird_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#9dccd4'], ['magenta', '#a898c4'],
      \ ['red',  '#c08878'], ['166',     '#c8b47c']
    \ ]
endif

let g:rainbow_guifgs = [ '#c8b47c', '#c08878', '#a898c4', '#9dccd4' ]
let g:rainbow_ctermfgs = [ '179', '174', '140', '116' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd GreybirdGreenSign
hi! link GitGutterChange GreybirdAquaSign
hi! link GitGutterDelete GreybirdRedSign
hi! link GitGutterChangeDelete GreybirdAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile GreybirdGreen
hi! link gitcommitDiscardedFile GreybirdRed

" }}}
" Signify: {{{

hi! link SignifySignAdd GreybirdGreenSign
hi! link SignifySignChange GreybirdAquaSign
hi! link SignifySignDelete GreybirdRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign GreybirdRedSign
hi! link SyntasticWarningSign GreybirdYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   GreybirdBlueSign
hi! link SignatureMarkerText GreybirdPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl GreybirdBlueSign
hi! link ShowMarksHLu GreybirdBlueSign
hi! link ShowMarksHLo GreybirdBlueSign
hi! link ShowMarksHLm GreybirdBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch GreybirdYellow
hi! link CtrlPNoEntries GreybirdRed
hi! link CtrlPPrtBase GreybirdBg2
hi! link CtrlPPrtCursor GreybirdBlue
hi! link CtrlPLinePre GreybirdBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket GreybirdFg3
hi! link StartifyFile GreybirdFg1
hi! link StartifyNumber GreybirdBlue
hi! link StartifyPath GreybirdGray
hi! link StartifySlash GreybirdGray
hi! link StartifySection GreybirdYellow
hi! link StartifySpecial GreybirdBg2
hi! link StartifyHeader GreybirdOrange
hi! link StartifyFooter GreybirdBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign GreybirdRedSign
hi! link ALEWarningSign GreybirdYellowSign
hi! link ALEInfoSign GreybirdBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail GreybirdAqua
hi! link DirvishArg GreybirdYellow

" }}}
" Netrw: {{{

hi! link netrwDir GreybirdAqua
hi! link netrwClassify GreybirdAqua
hi! link netrwLink GreybirdGray
hi! link netrwSymLink GreybirdFg1
hi! link netrwExe GreybirdYellow
hi! link netrwComment GreybirdGray
hi! link netrwList GreybirdBlue
hi! link netrwHelpCmd GreybirdAqua
hi! link netrwCmdSep GreybirdFg3
hi! link netrwVersion GreybirdGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir GreybirdAqua
hi! link NERDTreeDirSlash GreybirdAqua

hi! link NERDTreeOpenable GreybirdBlue
hi! link NERDTreeClosable GreybirdBlue

hi! link NERDTreeFile GreybirdFg1
hi! link NERDTreeExecFile GreybirdYellow

hi! link NERDTreeUp GreybirdGray
hi! link NERDTreeCWD GreybirdGreen
hi! link NERDTreeHelp GreybirdFg1

hi! link NERDTreeToggleOn GreybirdGreen
hi! link NERDTreeToggleOff GreybirdRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign GreybirdRedSign
hi! link CocWarningSign GreybirdOrangeSign
hi! link CocInfoSign GreybirdYellowSign
hi! link CocHintSign GreybirdBlueSign
hi! link CocErrorFloat GreybirdRed
hi! link CocWarningFloat GreybirdOrange
hi! link CocInfoFloat GreybirdYellow
hi! link CocHintFloat GreybirdBlue
hi! link CocDiagnosticsError GreybirdRed
hi! link CocDiagnosticsWarning GreybirdOrange
hi! link CocDiagnosticsInfo GreybirdYellow
hi! link CocDiagnosticsHint GreybirdBlue

hi! link CocSelectedText GreybirdRed
hi! link CocCodeLens GreybirdGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded GreybirdGreen
hi! link diffRemoved GreybirdRed
hi! link diffChanged GreybirdAqua

hi! link diffFile GreybirdOrange
hi! link diffNewFile GreybirdYellow

hi! link diffLine GreybirdBlue

" }}}
" Html: {{{

hi! link htmlTag GreybirdBlue
hi! link htmlEndTag GreybirdBlue
hi! link htmlTagName GreybirdAquaBold
hi! link htmlArg GreybirdAqua
hi! link htmlScriptTag GreybirdPurple
hi! link htmlTagN GreybirdFg1
hi! link htmlSpecialTagName GreybirdAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar GreybirdOrange

call s:HL('htmlBold', s:vim_bg, s:vim_fg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_bg, s:vim_fg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_bg, s:vim_fg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_bg, s:vim_fg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_bg, s:vim_fg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_bg, s:vim_fg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_bg, s:vim_fg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag GreybirdBlue
hi! link xmlEndTag GreybirdBlue
hi! link xmlTagName GreybirdBlue
hi! link xmlEqual GreybirdBlue
hi! link docbkKeyword GreybirdAquaBold

hi! link xmlDocTypeDecl GreybirdGray
hi! link xmlDocTypeKeyword GreybirdPurple
hi! link xmlCdataStart GreybirdGray
hi! link xmlCdataCdata GreybirdPurple
hi! link dtdFunction GreybirdGray
hi! link dtdTagName GreybirdPurple

hi! link xmlAttrib GreybirdAqua
hi! link xmlProcessingDelim GreybirdGray
hi! link xmlAttribPunct GreybirdGray

hi! link xmlEntity GreybirdOrange
hi! link xmlEntityPunct GreybirdOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italic)

hi! link vimNotation GreybirdOrange
hi! link vimBracket GreybirdOrange
hi! link vimMapModKey GreybirdOrange
hi! link vimFuncSID GreybirdFg3
hi! link vimSetSep GreybirdFg3
hi! link vimSep GreybirdFg3
hi! link vimContinue GreybirdFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword GreybirdBlue
hi! link clojureCond GreybirdOrange
hi! link clojureSpecial GreybirdOrange
hi! link clojureDefine GreybirdOrange

hi! link clojureFunc GreybirdYellow
hi! link clojureRepeat GreybirdYellow
hi! link clojureCharacter GreybirdAqua
hi! link clojureStringEscape GreybirdAqua
hi! link clojureException GreybirdRed

hi! link clojureRegexp GreybirdAqua
hi! link clojureRegexpEscape GreybirdAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen GreybirdFg3
hi! link clojureAnonArg GreybirdYellow
hi! link clojureVariable GreybirdBlue
hi! link clojureMacro GreybirdOrange

hi! link clojureMeta GreybirdYellow
hi! link clojureDeref GreybirdYellow
hi! link clojureQuote GreybirdYellow
hi! link clojureUnquote GreybirdYellow

" }}}
" C: {{{

hi! link cOperator GreybirdPurple
hi! link cStructure GreybirdOrange

" }}}
" Python: {{{

hi! link pythonBuiltin GreybirdOrange
hi! link pythonBuiltinObj GreybirdOrange
hi! link pythonBuiltinFunc GreybirdOrange
hi! link pythonFunction GreybirdAqua
hi! link pythonDecorator GreybirdBlue
hi! link pythonInclude GreybirdBlue
hi! link pythonImport GreybirdBlue
hi! link pythonRun GreybirdBlue
hi! link pythonCoding GreybirdBlue
hi! link pythonOperator GreybirdRed
hi! link pythonException GreybirdRed
hi! link pythonExceptions GreybirdPurple
hi! link pythonBoolean GreybirdPurple
hi! link pythonDot GreybirdFg3
hi! link pythonConditional GreybirdBlue
hi! link pythonRepeat GreybirdBlue
hi! link pythonDottedName GreybirdGreenBold

" }}}
" CSS: {{{

hi! link cssBraces GreybirdBlue
hi! link cssFunctionName GreybirdYellow
hi! link cssIdentifier GreybirdOrange
hi! link cssClassName GreybirdGreen
hi! link cssColor GreybirdBlue
hi! link cssSelectorOp GreybirdBlue
hi! link cssSelectorOp2 GreybirdBlue
hi! link cssImportant GreybirdGreen
hi! link cssVendor GreybirdFg1

hi! link cssTextProp GreybirdAqua
hi! link cssAnimationProp GreybirdAqua
hi! link cssUIProp GreybirdYellow
hi! link cssTransformProp GreybirdAqua
hi! link cssTransitionProp GreybirdAqua
hi! link cssPrintProp GreybirdAqua
hi! link cssPositioningProp GreybirdYellow
hi! link cssBoxProp GreybirdAqua
hi! link cssFontDescriptorProp GreybirdAqua
hi! link cssFlexibleBoxProp GreybirdAqua
hi! link cssBorderOutlineProp GreybirdAqua
hi! link cssBackgroundProp GreybirdAqua
hi! link cssMarginProp GreybirdAqua
hi! link cssListProp GreybirdAqua
hi! link cssTableProp GreybirdAqua
hi! link cssFontProp GreybirdAqua
hi! link cssPaddingProp GreybirdAqua
hi! link cssDimensionProp GreybirdAqua
hi! link cssRenderProp GreybirdAqua
hi! link cssColorProp GreybirdAqua
hi! link cssGeneratedContentProp GreybirdAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces GreybirdFg1
hi! link javaScriptFunction GreybirdAqua
hi! link javaScriptIdentifier GreybirdBlue
hi! link javaScriptMember GreybirdBlue
hi! link javaScriptNumber GreybirdPurple
hi! link javaScriptNull GreybirdPurple
hi! link javaScriptParens GreybirdFg3

" }}}
" YAJS: {{{

hi! link javascriptImport GreybirdAqua
hi! link javascriptExport GreybirdAqua
hi! link javascriptClassKeyword GreybirdAqua
hi! link javascriptClassExtends GreybirdAqua
hi! link javascriptDefault GreybirdAqua

hi! link javascriptClassName GreybirdYellow
hi! link javascriptClassSuperName GreybirdYellow
hi! link javascriptGlobal GreybirdYellow

hi! link javascriptEndColons GreybirdFg1
hi! link javascriptFuncArg GreybirdFg1
hi! link javascriptGlobalMethod GreybirdFg1
hi! link javascriptNodeGlobal GreybirdFg1

hi! link javascriptBracket GreybirdFg1
hi! link javascriptOpSymbol GreybirdFg1
hi! link javascriptOpSymbols GreybirdFg1
hi! link javascriptIdentifierName GreybirdFg1
hi! link javascriptVariable GreybirdOrange
hi! link javascriptIdentifier GreybirdOrange
hi! link javascriptClassSuper GreybirdOrange
hi! link javascriptFuncKeyword GreybirdOrange
hi! link javascriptAsyncFunc GreybirdOrange
hi! link javascriptClassStatic GreybirdOrange

hi! link javascriptOperator GreybirdRed
hi! link javascriptForOperator GreybirdRed
hi! link javascriptYield GreybirdRed
hi! link javascriptExceptions GreybirdRed
hi! link javascriptMessage GreybirdRed

hi! link javascriptTemplateSB GreybirdAqua
hi! link javascriptTemplateSubstitution GreybirdAqua

hi! link javascriptLabel GreybirdBlue
hi! link javascriptObjectLabel GreybirdBlue
hi! link javascriptPropertyName GreybirdBlue

hi! link javascriptLogicSymbols GreybirdBlue
hi! link javascriptArrowFunc GreybirdYellow

hi! link javascriptDocParamName GreybirdBlue
hi! link javascriptDocTags GreybirdBlue
hi! link javascriptDocNotation GreybirdBlue
hi! link javascriptDocParamType GreybirdBlue
hi! link javascriptDocNamedParamType GreybirdBlue

hi! link javascriptBrackets GreybirdFg1
hi! link javascriptDOMElemAttrs GreybirdFg1
hi! link javascriptDOMEventMethod GreybirdFg1
hi! link javascriptDOMNodeMethod GreybirdFg1
hi! link javascriptDOMStorageMethod GreybirdFg1
hi! link javascriptDateMethod GreybirdFg1
hi! link javascriptArrayMethod GreybirdFg1
hi! link javascriptNumberMethod GreybirdFg1
hi! link javascriptStringMethod GreybirdFg1
hi! link javascriptURLMethod GreybirdFg1
hi! link javascriptFunctionMethod GreybirdFg1
hi! link javascriptJSONMethod GreybirdFg1

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword GreybirdAqua
hi! link jsExtendsKeyword GreybirdAqua
hi! link jsExportDefault GreybirdAqua
hi! link jsTemplateBraces GreybirdAqua
hi! link jsGlobalNodeObjects GreybirdFg1
hi! link jsGlobalObjects GreybirdFg1
hi! link jsFunction GreybirdOrange
hi! link jsFuncParens GreybirdFg3
hi! link jsParens GreybirdFg3
hi! link jsNull GreybirdPurple
hi! link jsUndefined GreybirdPurple
hi! link jsClassDefinition GreybirdYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved GreybirdAqua
hi! link typeScriptLabel GreybirdAqua
hi! link typeScriptFuncKeyword GreybirdAqua
hi! link typeScriptIdentifier GreybirdOrange
hi! link typeScriptBraces GreybirdFg1
hi! link typeScriptEndColons GreybirdFg1
hi! link typeScriptDOMObjects GreybirdFg1
hi! link typeScriptAjaxMethods GreybirdFg1
hi! link typeScriptLogicSymbols GreybirdFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects GreybirdFg1
hi! link typeScriptParens GreybirdFg3
hi! link typeScriptOpSymbols GreybirdFg3
hi! link typeScriptHtmlElemProperties GreybirdFg1
hi! link typeScriptNull GreybirdPurple
hi! link typeScriptInterpolationDelimiter GreybirdAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword GreybirdAqua
hi! link purescriptModuleName GreybirdFg1
hi! link purescriptWhere GreybirdAqua
hi! link purescriptDelimiter GreybirdFg4
hi! link purescriptType GreybirdFg1
hi! link purescriptImportKeyword GreybirdAqua
hi! link purescriptHidingKeyword GreybirdAqua
hi! link purescriptAsKeyword GreybirdAqua
hi! link purescriptStructure GreybirdAqua
hi! link purescriptOperator GreybirdBlue

hi! link purescriptTypeVar GreybirdFg1
hi! link purescriptConstructor GreybirdFg1
hi! link purescriptFunction GreybirdFg1
hi! link purescriptConditional GreybirdOrange
hi! link purescriptBacktick GreybirdOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp GreybirdFg3
hi! link coffeeSpecialOp GreybirdFg3
hi! link coffeeCurly GreybirdOrange
hi! link coffeeParen GreybirdFg3
hi! link coffeeBracket GreybirdOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter GreybirdGreen
hi! link rubyInterpolationDelimiter GreybirdAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier GreybirdRed
hi! link objcDirective GreybirdBlue

" }}}
" Go: {{{

hi! link goDirective GreybirdAqua
hi! link goConstants GreybirdPurple
hi! link goDeclaration GreybirdBlue
hi! link goDeclType GreybirdBlue
hi! link goBuiltins GreybirdOrange

" }}}
" Lua: {{{

hi! link luaIn GreybirdBlue
hi! link luaFunction GreybirdAqua
hi! link luaTable GreybirdOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp GreybirdFg3
hi! link moonExtendedOp GreybirdFg3
hi! link moonFunction GreybirdFg3
hi! link moonObject GreybirdYellow

" }}}
" Java: {{{

hi! link javaAnnotation GreybirdBlue
hi! link javaDocTags GreybirdAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen GreybirdFg3
hi! link javaParen1 GreybirdFg3
hi! link javaParen2 GreybirdFg3
hi! link javaParen3 GreybirdFg3
hi! link javaParen4 GreybirdFg3
hi! link javaParen5 GreybirdFg3
hi! link javaOperator GreybirdOrange

hi! link javaVarArg GreybirdGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter GreybirdGreen
hi! link elixirInterpolationDelimiter GreybirdAqua

hi! link elixirModuleDeclaration GreybirdYellow

" }}}
" Scala: {{{

hi! link scalaNameDefinition GreybirdFg1
hi! link scalaCaseFollowing GreybirdFg1
hi! link scalaCapitalWord GreybirdFg1
hi! link scalaTypeExtension GreybirdFg1

hi! link scalaKeyword GreybirdBlue
hi! link scalaKeywordModifier GreybirdBlue

hi! link scalaSpecial GreybirdAqua
hi! link scalaOperator GreybirdFg1

hi! link scalaTypeDeclaration GreybirdYellow
hi! link scalaTypeTypePostDeclaration GreybirdYellow

hi! link scalaInstanceDeclaration GreybirdFg1
hi! link scalaInterpolation GreybirdAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 GreybirdGreenBold
hi! link markdownH2 GreybirdGreenBold
hi! link markdownH3 GreybirdYellowBold
hi! link markdownH4 GreybirdYellowBold
hi! link markdownH5 GreybirdYellow
hi! link markdownH6 GreybirdYellow

hi! link markdownCode GreybirdAqua
hi! link markdownCodeBlock GreybirdAqua
hi! link markdownCodeDelimiter GreybirdAqua

hi! link markdownBlockquote GreybirdGray
hi! link markdownListMarker GreybirdGray
hi! link markdownOrderedListMarker GreybirdGray
hi! link markdownRule GreybirdGray
hi! link markdownHeadingRule GreybirdGray

hi! link markdownUrlDelimiter GreybirdFg3
hi! link markdownLinkDelimiter GreybirdFg3
hi! link markdownLinkTextDelimiter GreybirdFg3

hi! link markdownHeadingDelimiter GreybirdOrange
hi! link markdownUrl GreybirdPurple
hi! link markdownUrlTitleDelimiter GreybirdGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

hi! link haskellType GreybirdFg1
hi! link haskellIdentifier GreybirdFg1
hi! link haskellSeparator GreybirdFg1
hi! link haskellDelimiter GreybirdFg4
hi! link haskellOperators GreybirdBlue

hi! link haskellBacktick GreybirdOrange
hi! link haskellStatement GreybirdOrange
hi! link haskellConditional GreybirdOrange

hi! link haskellLet GreybirdAqua
hi! link haskellDefault GreybirdAqua
hi! link haskellWhere GreybirdAqua
hi! link haskellBottom GreybirdAqua
hi! link haskellBlockKeywords GreybirdAqua
hi! link haskellImportKeywords GreybirdAqua
hi! link haskellDeclKeyword GreybirdAqua
hi! link haskellDeriving GreybirdAqua
hi! link haskellAssocType GreybirdAqua

hi! link haskellNumber GreybirdPurple
hi! link haskellPragma GreybirdPurple

hi! link haskellString GreybirdGreen
hi! link haskellChar GreybirdGreen

" }}}
" Json: {{{

hi! link jsonKeyword GreybirdGreen
hi! link jsonQuote GreybirdGreen
hi! link jsonBraces GreybirdFg1
hi! link jsonString GreybirdFg1

" }}}
" Rust: {{{

hi! link rustPubScopeCrate GreybirdAqua

" }}}

" ALE: {{{

hi! link ALEWarning GreybirdYellowBold
hi! link ALEError GreybirdRedBold

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
