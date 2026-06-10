" -----------------------------------------------------------------------------
" File: blue_teal.vim
" Description: Deep ocean palette — blue-teal dark theme
" Palette sourced from hex_colors.txt and alacritty.toml
" -----------------------------------------------------------------------------

" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='blue_teal'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:blueteal_bold')
  let g:blueteal_bold=1
endif
if !exists('g:blueteal_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:blueteal_italic=1
  else
    let g:blueteal_italic=0
  endif
endif
if !exists('g:blueteal_undercurl')
  let g:blueteal_undercurl=1
endif
if !exists('g:blueteal_underline')
  let g:blueteal_underline=1
endif
if !exists('g:blueteal_inverse')
  let g:blueteal_inverse=1
endif

if !exists('g:blueteal_guisp_fallback') || index(['fg', 'bg'], g:blueteal_guisp_fallback) == -1
  let g:blueteal_guisp_fallback='NONE'
endif

if !exists('g:blueteal_improved_strings')
  let g:blueteal_improved_strings=0
endif

if !exists('g:blueteal_improved_warnings')
  let g:blueteal_improved_warnings=0
endif

if !exists('g:blueteal_termcolors')
  let g:blueteal_termcolors=256
endif

if !exists('g:blueteal_invert_indent_guides')
  let g:blueteal_invert_indent_guides=0
endif

if !exists('g:blueteal_contrast_dark')
  let g:blueteal_contrast_dark='medium'
endif

if !exists('g:blueteal_contrast_light')
  let g:blueteal_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

let s:bt = {}

" Backgrounds — stepped from darkest to lightest
let s:bt.dark0_hard  = ['#1A2B2E', 235]   " deeper than primary bg
let s:bt.dark0       = ['#203033', 235]   " primary.background
let s:bt.dark0_soft  = ['#252F33', 236]   " lifted bg
let s:bt.dark1       = ['#293D42', 236]   " bright.black — modeline, sidebars
let s:bt.dark2       = ['#2C444E', 237]   " selection.background
let s:bt.dark3       = ['#304048', 65]    " hl-line, panels
let s:bt.dark4       = ['#3A4C52', 238]   " panel borders

let s:bt.gray_245    = ['#607A82', 66]    " comments, line-numbers
let s:bt.gray_244    = ['#607A82', 66]

" Foregrounds — stepped from brightest to dimmest
let s:bt.light0_hard = ['#D0E4E8', 188]   " brightest white
let s:bt.light0      = ['#C2D6DA', 188]   " primary foreground
let s:bt.light0_soft = ['#C2D6DA', 188]
let s:bt.light1      = ['#A8C8CE', 250]   " secondary fg
let s:bt.light2      = ['#90B4BC', 247]   " dimmer fg
let s:bt.light3      = ['#7A9AA2', 245]   " muted fg
let s:bt.light4      = ['#607A82', 66]    " faint

" Accent colours — spread across a wider luminosity range for clear hierarchy
let s:bt.bright_red     = ['#C87878', 174]  " errors — L~58%, clearly visible
let s:bt.bright_green   = ['#6EAA78', 115]  " strings — L~54%, sage green
let s:bt.bright_yellow  = ['#B8A060', 179]  " types — L~56%, warm amber
let s:bt.bright_blue    = ['#5C88C8', 116]  " keywords — L~58%, clear blue
let s:bt.bright_purple  = ['#9070B0', 140]  " constants — L~53%, dusty purple
let s:bt.bright_aqua    = ['#6AC0CC', 109]  " functions — L~62%, brightest accent
let s:bt.bright_orange  = ['#C09060', 179]  " preprocessor — L~56%, warm sienna

let s:bt.neutral_red    = ['#A06060', 174]
let s:bt.neutral_green  = ['#508A58', 115]
let s:bt.neutral_yellow = ['#907A48', 179]
let s:bt.neutral_blue   = ['#4468A8', 116]
let s:bt.neutral_purple = ['#705888', 140]
let s:bt.neutral_aqua   = ['#509898', 109]
let s:bt.neutral_orange = ['#A07048', 179]

let s:bt.faded_red      = ['#7A4040', 131]
let s:bt.faded_green    = ['#3A6040', 72]
let s:bt.faded_yellow   = ['#6A5A38', 136]
let s:bt.faded_blue     = ['#324C80', 73]
let s:bt.faded_purple   = ['#503858', 97]
let s:bt.faded_aqua     = ['#387080', 67]
let s:bt.faded_orange   = ['#7A5030', 130]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:blueteal_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:blueteal_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:blueteal_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:blueteal_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:blueteal_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

if s:is_dark
  let s:bg0  = s:bt.dark0
  if g:blueteal_contrast_dark == 'soft'
    let s:bg0  = s:bt.dark0_soft
  elseif g:blueteal_contrast_dark == 'hard'
    let s:bg0  = s:bt.dark0_hard
  endif

  let s:bg1  = s:bt.dark1
  let s:bg2  = s:bt.dark2
  let s:bg3  = s:bt.dark3
  let s:bg4  = s:bt.dark4

  let s:gray = s:bt.gray_245

  let s:fg0 = s:bt.light0
  let s:fg1 = s:bt.light1
  let s:fg2 = s:bt.light2
  let s:fg3 = s:bt.light3
  let s:fg4 = s:bt.light4

  let s:fg4_256 = s:bt.light4

  let s:red    = s:bt.bright_red
  let s:green  = s:bt.bright_green
  let s:yellow = s:bt.bright_yellow
  let s:blue   = s:bt.bright_blue
  let s:purple = s:bt.bright_purple
  let s:aqua   = s:bt.bright_aqua
  let s:orange = s:bt.bright_orange
else
  let s:bg0  = s:bt.light0
  if g:blueteal_contrast_light == 'soft'
    let s:bg0  = s:bt.light0_soft
  elseif g:blueteal_contrast_light == 'hard'
    let s:bg0  = s:bt.light0_hard
  endif

  let s:bg1  = s:bt.light1
  let s:bg2  = s:bt.light2
  let s:bg3  = s:bt.light3
  let s:bg4  = s:bt.light4

  let s:gray = s:bt.gray_244

  let s:fg0 = s:bt.dark0
  let s:fg1 = s:bt.dark1
  let s:fg2 = s:bt.dark2
  let s:fg3 = s:bt.dark3
  let s:fg4 = s:bt.dark4

  let s:fg4_256 = s:bt.dark4

  let s:red    = s:bt.faded_red
  let s:green  = s:bt.faded_green
  let s:yellow = s:bt.faded_yellow
  let s:blue   = s:bt.faded_blue
  let s:purple = s:bt.faded_purple
  let s:aqua   = s:bt.faded_aqua
  let s:orange = s:bt.faded_orange
endif

if g:blueteal_termcolors == 16
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

let s:bt.bg0 = s:bg0
let s:bt.bg1 = s:bg1
let s:bt.bg2 = s:bg2
let s:bt.bg3 = s:bg3
let s:bt.bg4 = s:bg4

let s:bt.gray = s:gray

let s:bt.fg0 = s:fg0
let s:bt.fg1 = s:fg1
let s:bt.fg2 = s:fg2
let s:bt.fg3 = s:fg3
let s:bt.fg4 = s:fg4

let s:bt.fg4_256 = s:fg4_256

let s:bt.red    = s:red
let s:bt.green  = s:green
let s:bt.yellow = s:yellow
let s:bt.blue   = s:blue
let s:bt.purple = s:purple
let s:bt.aqua   = s:aqua
let s:bt.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0  = s:bg0[0]
  let g:terminal_color_8  = s:gray[0]

  let g:terminal_color_1  = s:bt.neutral_red[0]
  let g:terminal_color_9  = s:red[0]

  let g:terminal_color_2  = s:bt.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3  = s:bt.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4  = s:bt.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5  = s:bt.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6  = s:bt.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7  = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:blueteal_hls_cursor')
  let s:hls_cursor = get(s:bt, g:blueteal_hls_cursor)
endif

let s:number_column = s:none
if exists('g:blueteal_number_column')
  let s:number_column = get(s:bt, g:blueteal_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:blueteal_sign_column')
    let s:sign_column = get(s:bt, g:blueteal_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:blueteal_color_column')
  let s:color_column = get(s:bt, g:blueteal_color_column)
endif

let s:vert_split = s:bg0
if exists('g:blueteal_vert_split')
  let s:vert_split = get(s:bt, g:blueteal_vert_split)
endif

let s:invert_signs = ''
if exists('g:blueteal_invert_signs')
  if g:blueteal_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:blueteal_invert_selection')
  if g:blueteal_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:blueteal_invert_tabline')
  if g:blueteal_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:blueteal_italicize_comments')
  if g:blueteal_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:blueteal_italicize_strings')
  if g:blueteal_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  let fg = a:fg

  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  if a:0 >= 3
    if g:blueteal_guisp_fallback != 'NONE'
      let fg = a:3
    endif
    if g:blueteal_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" BlueTeal Hi Groups: {{{

call s:HL('BlueTealFg0', s:fg0)
call s:HL('BlueTealFg1', s:fg1)
call s:HL('BlueTealFg2', s:fg2)
call s:HL('BlueTealFg3', s:fg3)
call s:HL('BlueTealFg4', s:fg4)
call s:HL('BlueTealGray', s:gray)
call s:HL('BlueTealBg0', s:bg0)
call s:HL('BlueTealBg1', s:bg1)
call s:HL('BlueTealBg2', s:bg2)
call s:HL('BlueTealBg3', s:bg3)
call s:HL('BlueTealBg4', s:bg4)

call s:HL('BlueTealRed', s:red)
call s:HL('BlueTealRedBold', s:red, s:none, s:bold)
call s:HL('BlueTealGreen', s:green)
call s:HL('BlueTealGreenBold', s:green, s:none, s:bold)
call s:HL('BlueTealYellow', s:yellow)
call s:HL('BlueTealYellowBold', s:yellow, s:none, s:bold)
call s:HL('BlueTealBlue', s:blue)
call s:HL('BlueTealBlueBold', s:blue, s:none, s:bold)
call s:HL('BlueTealPurple', s:purple)
call s:HL('BlueTealPurpleBold', s:purple, s:none, s:bold)
call s:HL('BlueTealAqua', s:aqua)
call s:HL('BlueTealAquaBold', s:aqua, s:none, s:bold)
call s:HL('BlueTealOrange', s:orange)
call s:HL('BlueTealOrangeBold', s:orange, s:none, s:bold)

call s:HL('BlueTealRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('BlueTealGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('BlueTealYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('BlueTealBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('BlueTealPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('BlueTealAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('BlueTealOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

call s:HL('Normal', s:fg0, s:bg0)

if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  call s:HL('CursorLine',   s:none, s:bg1)
  hi! link CursorColumn CursorLine

  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  call s:HL('TabLineSel', s:blue, s:bg1, s:invert_tabline)
  hi! link TabLine TabLineFill

  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  call s:HL('ColorColumn',  s:none, s:color_column)
  call s:HL('Conceal', s:blue, s:none)
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText BlueTealBg3
hi! link SpecialKey BlueTealBg3

call s:HL('Visual',    s:none,  s:bg2, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg0, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

call s:HL('VertSplit', s:bg3, s:vert_split)

call s:HL('WildMenu', s:blue, s:bg2, s:bold)

hi! link Directory BlueTealAquaBold
hi! link Title BlueTealBlueBold

call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
hi! link MoreMsg BlueTealYellowBold
hi! link ModeMsg BlueTealYellowBold
hi! link Question BlueTealOrangeBold
hi! link WarningMsg BlueTealRedBold

" }}}
" Gutter: {{{

call s:HL('LineNr', s:bg4, s:number_column)
call s:HL('SignColumn', s:none, s:sign_column)
call s:HL('Folded', s:gray, s:bg1, s:italic)
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

call s:HL('Cursor', s:none, s:none, s:inverse)
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:blueteal_improved_strings == 0
  hi! link Special BlueTealOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Control flow keywords — the signature blue
hi! link Statement BlueTealBlue
hi! link Conditional BlueTealBlue
hi! link Repeat BlueTealBlue
hi! link Label BlueTealBlue
hi! link Exception BlueTealRed
hi! link Operator Normal
hi! link Keyword BlueTealBlue

" Identifiers and functions
hi! link Identifier BlueTealFg1
hi! link Function BlueTealAquaBold

" Preprocessor — warm sienna to contrast the cool palette
hi! link PreProc BlueTealOrange
hi! link Include BlueTealOrange
hi! link Define BlueTealOrange
hi! link Macro BlueTealOrange
hi! link PreCondit BlueTealOrange

" Constants — dusty purple/mauve
hi! link Constant BlueTealPurple
hi! link Character BlueTealPurple
if g:blueteal_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
hi! link Boolean BlueTealPurple
hi! link Number BlueTealPurple
hi! link Float BlueTealPurple

" Types — amber/yellow, clearly distinct from blue keywords
hi! link Type BlueTealYellow
hi! link StorageClass BlueTealOrange
hi! link Structure BlueTealAqua
hi! link Typedef BlueTealYellow

" }}}
" Completion Menu: {{{

if version >= 700
  call s:HL('Pmenu', s:fg1, s:bg2)
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  call s:HL('PmenuSbar', s:none, s:bg2)
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  if g:blueteal_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
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
  if g:blueteal_invert_indent_guides == 0
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
      \ ['blue', '#416099'], ['magenta', '#7A5A80'],
      \ ['red',  '#A06464'], ['179',     '#908060']
    \ ]
endif

let g:rainbow_guifgs = [ '#908060', '#A06464', '#7A5A80', '#416099' ]
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

" }}}
" GitGutter: {{{

hi! link GitGutterAdd BlueTealGreenSign
hi! link GitGutterChange BlueTealAquaSign
hi! link GitGutterDelete BlueTealRedSign
hi! link GitGutterChangeDelete BlueTealAquaSign

" }}}
" GitCommit: {{{

hi! link gitcommitSelectedFile BlueTealGreen
hi! link gitcommitDiscardedFile BlueTealRed

" }}}
" Signify: {{{

hi! link SignifySignAdd BlueTealGreenSign
hi! link SignifySignChange BlueTealAquaSign
hi! link SignifySignDelete BlueTealRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign BlueTealRedSign
hi! link SyntasticWarningSign BlueTealYellowSign

" }}}
" Signature: {{{

hi! link SignatureMarkText   BlueTealBlueSign
hi! link SignatureMarkerText BlueTealPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl BlueTealBlueSign
hi! link ShowMarksHLu BlueTealBlueSign
hi! link ShowMarksHLo BlueTealBlueSign
hi! link ShowMarksHLm BlueTealBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch BlueTealYellow
hi! link CtrlPNoEntries BlueTealRed
hi! link CtrlPPrtBase BlueTealBg2
hi! link CtrlPPrtCursor BlueTealBlue
hi! link CtrlPLinePre BlueTealBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket BlueTealFg3
hi! link StartifyFile BlueTealFg1
hi! link StartifyNumber BlueTealBlue
hi! link StartifyPath BlueTealGray
hi! link StartifySlash BlueTealGray
hi! link StartifySection BlueTealYellow
hi! link StartifySpecial BlueTealBg2
hi! link StartifyHeader BlueTealAqua
hi! link StartifyFooter BlueTealBg2

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

hi! link ALEErrorSign BlueTealRedSign
hi! link ALEWarningSign BlueTealYellowSign
hi! link ALEInfoSign BlueTealBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail BlueTealAqua
hi! link DirvishArg BlueTealYellow

" }}}
" Netrw: {{{

hi! link netrwDir BlueTealAqua
hi! link netrwClassify BlueTealAqua
hi! link netrwLink BlueTealGray
hi! link netrwSymLink BlueTealFg1
hi! link netrwExe BlueTealYellow
hi! link netrwComment BlueTealGray
hi! link netrwList BlueTealBlue
hi! link netrwHelpCmd BlueTealAqua
hi! link netrwCmdSep BlueTealFg3
hi! link netrwVersion BlueTealGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir BlueTealAqua
hi! link NERDTreeDirSlash BlueTealAqua

hi! link NERDTreeOpenable BlueTealBlue
hi! link NERDTreeClosable BlueTealBlue

hi! link NERDTreeFile BlueTealFg1
hi! link NERDTreeExecFile BlueTealYellow

hi! link NERDTreeUp BlueTealGray
hi! link NERDTreeCWD BlueTealAqua
hi! link NERDTreeHelp BlueTealFg1

hi! link NERDTreeToggleOn BlueTealGreen
hi! link NERDTreeToggleOff BlueTealRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign BlueTealRedSign
hi! link CocWarningSign BlueTealOrangeSign
hi! link CocInfoSign BlueTealYellowSign
hi! link CocHintSign BlueTealBlueSign
hi! link CocErrorFloat BlueTealRed
hi! link CocWarningFloat BlueTealOrange
hi! link CocInfoFloat BlueTealYellow
hi! link CocHintFloat BlueTealBlue
hi! link CocDiagnosticsError BlueTealRed
hi! link CocDiagnosticsWarning BlueTealOrange
hi! link CocDiagnosticsInfo BlueTealYellow
hi! link CocDiagnosticsHint BlueTealBlue

hi! link CocSelectedText BlueTealRed
hi! link CocCodeLens BlueTealGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded BlueTealGreen
hi! link diffRemoved BlueTealRed
hi! link diffChanged BlueTealAqua

hi! link diffFile BlueTealOrange
hi! link diffNewFile BlueTealYellow

hi! link diffLine BlueTealBlue

" }}}
" Html: {{{

hi! link htmlTag BlueTealBlue
hi! link htmlEndTag BlueTealBlue
hi! link htmlTagName BlueTealAquaBold
hi! link htmlArg BlueTealAqua
hi! link htmlScriptTag BlueTealPurple
hi! link htmlTagN BlueTealFg1
hi! link htmlSpecialTagName BlueTealAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar BlueTealOrange

call s:HL('htmlBold', s:vim_bg, s:vim_fg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_bg, s:vim_fg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_bg, s:vim_fg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_bg, s:vim_fg, s:bold . s:underline . s:italic)
call s:HL('htmlUnderline', s:vim_bg, s:vim_fg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_bg, s:vim_fg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_bg, s:vim_fg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag BlueTealBlue
hi! link xmlEndTag BlueTealBlue
hi! link xmlTagName BlueTealBlue
hi! link xmlEqual BlueTealBlue
hi! link docbkKeyword BlueTealAquaBold

hi! link xmlDocTypeDecl BlueTealGray
hi! link xmlDocTypeKeyword BlueTealPurple
hi! link xmlCdataStart BlueTealGray
hi! link xmlCdataCdata BlueTealPurple
hi! link dtdFunction BlueTealGray
hi! link dtdTagName BlueTealPurple

hi! link xmlAttrib BlueTealAqua
hi! link xmlProcessingDelim BlueTealGray
hi! link xmlAttribPunct BlueTealGray

hi! link xmlEntity BlueTealOrange
hi! link xmlEntityPunct BlueTealOrange

" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italic)

hi! link vimNotation BlueTealOrange
hi! link vimBracket BlueTealOrange
hi! link vimMapModKey BlueTealOrange
hi! link vimFuncSID BlueTealFg3
hi! link vimSetSep BlueTealFg3
hi! link vimSep BlueTealFg3
hi! link vimContinue BlueTealFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword BlueTealBlue
hi! link clojureCond BlueTealOrange
hi! link clojureSpecial BlueTealOrange
hi! link clojureDefine BlueTealOrange

hi! link clojureFunc BlueTealYellow
hi! link clojureRepeat BlueTealYellow
hi! link clojureCharacter BlueTealAqua
hi! link clojureStringEscape BlueTealAqua
hi! link clojureException BlueTealRed

hi! link clojureRegexp BlueTealAqua
hi! link clojureRegexpEscape BlueTealAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen BlueTealFg3
hi! link clojureAnonArg BlueTealYellow
hi! link clojureVariable BlueTealBlue
hi! link clojureMacro BlueTealOrange

hi! link clojureMeta BlueTealYellow
hi! link clojureDeref BlueTealYellow
hi! link clojureQuote BlueTealYellow
hi! link clojureUnquote BlueTealYellow

" }}}
" C: {{{

hi! link cOperator BlueTealPurple
hi! link cStructure BlueTealOrange

" }}}
" Python: {{{

hi! link pythonBuiltin BlueTealOrange
hi! link pythonBuiltinObj BlueTealOrange
hi! link pythonBuiltinFunc BlueTealOrange
hi! link pythonFunction BlueTealAqua
hi! link pythonDecorator BlueTealBlue
hi! link pythonInclude BlueTealBlue
hi! link pythonImport BlueTealBlue
hi! link pythonRun BlueTealBlue
hi! link pythonCoding BlueTealBlue
hi! link pythonOperator BlueTealRed
hi! link pythonException BlueTealRed
hi! link pythonExceptions BlueTealPurple
hi! link pythonBoolean BlueTealPurple
hi! link pythonDot BlueTealFg3
hi! link pythonConditional BlueTealBlue
hi! link pythonRepeat BlueTealBlue
hi! link pythonDottedName BlueTealGreenBold

" }}}
" CSS: {{{

hi! link cssBraces BlueTealBlue
hi! link cssFunctionName BlueTealYellow
hi! link cssIdentifier BlueTealOrange
hi! link cssClassName BlueTealGreen
hi! link cssColor BlueTealBlue
hi! link cssSelectorOp BlueTealBlue
hi! link cssSelectorOp2 BlueTealBlue
hi! link cssImportant BlueTealGreen
hi! link cssVendor BlueTealFg1

hi! link cssTextProp BlueTealAqua
hi! link cssAnimationProp BlueTealAqua
hi! link cssUIProp BlueTealYellow
hi! link cssTransformProp BlueTealAqua
hi! link cssTransitionProp BlueTealAqua
hi! link cssPrintProp BlueTealAqua
hi! link cssPositioningProp BlueTealYellow
hi! link cssBoxProp BlueTealAqua
hi! link cssFontDescriptorProp BlueTealAqua
hi! link cssFlexibleBoxProp BlueTealAqua
hi! link cssBorderOutlineProp BlueTealAqua
hi! link cssBackgroundProp BlueTealAqua
hi! link cssMarginProp BlueTealAqua
hi! link cssListProp BlueTealAqua
hi! link cssTableProp BlueTealAqua
hi! link cssFontProp BlueTealAqua
hi! link cssPaddingProp BlueTealAqua
hi! link cssDimensionProp BlueTealAqua
hi! link cssRenderProp BlueTealAqua
hi! link cssColorProp BlueTealAqua
hi! link cssGeneratedContentProp BlueTealAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces BlueTealFg1
hi! link javaScriptFunction BlueTealAqua
hi! link javaScriptIdentifier BlueTealBlue
hi! link javaScriptMember BlueTealBlue
hi! link javaScriptNumber BlueTealPurple
hi! link javaScriptNull BlueTealPurple
hi! link javaScriptParens BlueTealFg3

" }}}
" YAJS: {{{

hi! link javascriptImport BlueTealAqua
hi! link javascriptExport BlueTealAqua
hi! link javascriptClassKeyword BlueTealAqua
hi! link javascriptClassExtends BlueTealAqua
hi! link javascriptDefault BlueTealAqua

hi! link javascriptClassName BlueTealYellow
hi! link javascriptClassSuperName BlueTealYellow
hi! link javascriptGlobal BlueTealYellow

hi! link javascriptEndColons BlueTealFg1
hi! link javascriptFuncArg BlueTealFg1
hi! link javascriptGlobalMethod BlueTealFg1
hi! link javascriptNodeGlobal BlueTealFg1

hi! link javascriptBracket BlueTealFg1
hi! link javascriptOpSymbol BlueTealFg1
hi! link javascriptOpSymbols BlueTealFg1
hi! link javascriptIdentifierName BlueTealFg1
hi! link javascriptVariable BlueTealOrange
hi! link javascriptIdentifier BlueTealOrange
hi! link javascriptClassSuper BlueTealOrange
hi! link javascriptFuncKeyword BlueTealOrange
hi! link javascriptAsyncFunc BlueTealOrange
hi! link javascriptClassStatic BlueTealOrange

hi! link javascriptOperator BlueTealRed
hi! link javascriptForOperator BlueTealRed
hi! link javascriptYield BlueTealRed
hi! link javascriptExceptions BlueTealRed
hi! link javascriptMessage BlueTealRed

hi! link javascriptTemplateSB BlueTealAqua
hi! link javascriptTemplateSubstitution BlueTealAqua

hi! link javascriptLabel BlueTealBlue
hi! link javascriptObjectLabel BlueTealBlue
hi! link javascriptPropertyName BlueTealBlue

hi! link javascriptLogicSymbols BlueTealBlue
hi! link javascriptArrowFunc BlueTealYellow

hi! link javascriptDocParamName BlueTealBlue
hi! link javascriptDocTags BlueTealBlue
hi! link javascriptDocNotation BlueTealBlue
hi! link javascriptDocParamType BlueTealBlue
hi! link javascriptDocNamedParamType BlueTealBlue

hi! link javascriptBrackets BlueTealFg1
hi! link javascriptDOMElemAttrs BlueTealFg1
hi! link javascriptDOMEventMethod BlueTealFg1
hi! link javascriptDOMNodeMethod BlueTealFg1
hi! link javascriptDOMStorageMethod BlueTealFg1
hi! link javascriptDateMethod BlueTealFg1
hi! link javascriptArrayMethod BlueTealFg1
hi! link javascriptNumberMethod BlueTealFg1
hi! link javascriptStringMethod BlueTealFg1
hi! link javascriptURLMethod BlueTealFg1
hi! link javascriptFunctionMethod BlueTealFg1
hi! link javascriptJSONMethod BlueTealFg1

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword BlueTealAqua
hi! link jsExtendsKeyword BlueTealAqua
hi! link jsExportDefault BlueTealAqua
hi! link jsTemplateBraces BlueTealAqua
hi! link jsGlobalNodeObjects BlueTealFg1
hi! link jsGlobalObjects BlueTealFg1
hi! link jsFunction BlueTealOrange
hi! link jsFuncParens BlueTealFg3
hi! link jsParens BlueTealFg3
hi! link jsNull BlueTealPurple
hi! link jsUndefined BlueTealPurple
hi! link jsClassDefinition BlueTealYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved BlueTealAqua
hi! link typeScriptLabel BlueTealAqua
hi! link typeScriptFuncKeyword BlueTealAqua
hi! link typeScriptIdentifier BlueTealOrange
hi! link typeScriptBraces BlueTealFg1
hi! link typeScriptEndColons BlueTealFg1
hi! link typeScriptDOMObjects BlueTealFg1
hi! link typeScriptAjaxMethods BlueTealFg1
hi! link typeScriptLogicSymbols BlueTealFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects BlueTealFg1
hi! link typeScriptParens BlueTealFg3
hi! link typeScriptOpSymbols BlueTealFg3
hi! link typeScriptHtmlElemProperties BlueTealFg1
hi! link typeScriptNull BlueTealPurple
hi! link typeScriptInterpolationDelimiter BlueTealAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword BlueTealAqua
hi! link purescriptModuleName BlueTealFg1
hi! link purescriptWhere BlueTealAqua
hi! link purescriptDelimiter BlueTealFg4
hi! link purescriptType BlueTealFg1
hi! link purescriptImportKeyword BlueTealAqua
hi! link purescriptHidingKeyword BlueTealAqua
hi! link purescriptAsKeyword BlueTealAqua
hi! link purescriptStructure BlueTealAqua
hi! link purescriptOperator BlueTealBlue

hi! link purescriptTypeVar BlueTealFg1
hi! link purescriptConstructor BlueTealFg1
hi! link purescriptFunction BlueTealFg1
hi! link purescriptConditional BlueTealOrange
hi! link purescriptBacktick BlueTealOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp BlueTealFg3
hi! link coffeeSpecialOp BlueTealFg3
hi! link coffeeCurly BlueTealOrange
hi! link coffeeParen BlueTealFg3
hi! link coffeeBracket BlueTealOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter BlueTealGreen
hi! link rubyInterpolationDelimiter BlueTealAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier BlueTealRed
hi! link objcDirective BlueTealBlue

" }}}
" Go: {{{

hi! link goDirective BlueTealAqua
hi! link goConstants BlueTealPurple
hi! link goDeclaration BlueTealBlue
hi! link goDeclType BlueTealBlue
hi! link goBuiltins BlueTealOrange

" }}}
" Lua: {{{

hi! link luaIn BlueTealBlue
hi! link luaFunction BlueTealAqua
hi! link luaTable BlueTealOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp BlueTealFg3
hi! link moonExtendedOp BlueTealFg3
hi! link moonFunction BlueTealFg3
hi! link moonObject BlueTealYellow

" }}}
" Java: {{{

hi! link javaAnnotation BlueTealBlue
hi! link javaDocTags BlueTealAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen BlueTealFg3
hi! link javaParen1 BlueTealFg3
hi! link javaParen2 BlueTealFg3
hi! link javaParen3 BlueTealFg3
hi! link javaParen4 BlueTealFg3
hi! link javaParen5 BlueTealFg3
hi! link javaOperator BlueTealOrange

hi! link javaVarArg BlueTealGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter BlueTealGreen
hi! link elixirInterpolationDelimiter BlueTealAqua

hi! link elixirModuleDeclaration BlueTealYellow

" }}}
" Scala: {{{

hi! link scalaNameDefinition BlueTealFg1
hi! link scalaCaseFollowing BlueTealFg1
hi! link scalaCapitalWord BlueTealFg1
hi! link scalaTypeExtension BlueTealFg1

hi! link scalaKeyword BlueTealBlue
hi! link scalaKeywordModifier BlueTealBlue

hi! link scalaSpecial BlueTealAqua
hi! link scalaOperator BlueTealFg1

hi! link scalaTypeDeclaration BlueTealYellow
hi! link scalaTypeTypePostDeclaration BlueTealYellow

hi! link scalaInstanceDeclaration BlueTealFg1
hi! link scalaInterpolation BlueTealAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 BlueTealBlueBold
hi! link markdownH2 BlueTealBlueBold
hi! link markdownH3 BlueTealAquaBold
hi! link markdownH4 BlueTealAquaBold
hi! link markdownH5 BlueTealAqua
hi! link markdownH6 BlueTealAqua

hi! link markdownCode BlueTealYellow
hi! link markdownCodeBlock BlueTealYellow
hi! link markdownCodeDelimiter BlueTealYellow

hi! link markdownBlockquote BlueTealGray
hi! link markdownListMarker BlueTealGray
hi! link markdownOrderedListMarker BlueTealGray
hi! link markdownRule BlueTealGray
hi! link markdownHeadingRule BlueTealGray

hi! link markdownUrlDelimiter BlueTealFg3
hi! link markdownLinkDelimiter BlueTealFg3
hi! link markdownLinkTextDelimiter BlueTealFg3

hi! link markdownHeadingDelimiter BlueTealOrange
hi! link markdownUrl BlueTealPurple
hi! link markdownUrlTitleDelimiter BlueTealGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

hi! link haskellType BlueTealFg1
hi! link haskellIdentifier BlueTealFg1
hi! link haskellSeparator BlueTealFg1
hi! link haskellDelimiter BlueTealFg4
hi! link haskellOperators BlueTealBlue

hi! link haskellBacktick BlueTealOrange
hi! link haskellStatement BlueTealOrange
hi! link haskellConditional BlueTealOrange

hi! link haskellLet BlueTealAqua
hi! link haskellDefault BlueTealAqua
hi! link haskellWhere BlueTealAqua
hi! link haskellBottom BlueTealAqua
hi! link haskellBlockKeywords BlueTealAqua
hi! link haskellImportKeywords BlueTealAqua
hi! link haskellDeclKeyword BlueTealAqua
hi! link haskellDeriving BlueTealAqua
hi! link haskellAssocType BlueTealAqua

hi! link haskellNumber BlueTealPurple
hi! link haskellPragma BlueTealPurple

hi! link haskellString BlueTealGreen
hi! link haskellChar BlueTealGreen

" }}}
" Json: {{{

hi! link jsonKeyword BlueTealGreen
hi! link jsonQuote BlueTealGreen
hi! link jsonBraces BlueTealFg1
hi! link jsonString BlueTealFg1

" }}}
" Rust: {{{

hi! link rustPubScopeCrate BlueTealAqua

" }}}
" ALE: {{{

hi! link ALEWarning BlueTealYellowBold
hi! link ALEError BlueTealRedBold

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
