" -----------------------------------------------------------------------------
" File: dark_slate.vim
" Description: High-contrast dark navy theme — built on the dark_slate palette
" Palette sourced from alacritty themes/slate_theme.toml
" -----------------------------------------------------------------------------

" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='dark_slate'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:darkslate_bold')
  let g:darkslate_bold=1
endif
if !exists('g:darkslate_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:darkslate_italic=1
  else
    let g:darkslate_italic=0
  endif
endif
if !exists('g:darkslate_undercurl')
  let g:darkslate_undercurl=1
endif
if !exists('g:darkslate_underline')
  let g:darkslate_underline=1
endif
if !exists('g:darkslate_inverse')
  let g:darkslate_inverse=1
endif

if !exists('g:darkslate_guisp_fallback') || index(['fg', 'bg'], g:darkslate_guisp_fallback) == -1
  let g:darkslate_guisp_fallback='NONE'
endif

if !exists('g:darkslate_improved_strings')
  let g:darkslate_improved_strings=0
endif

if !exists('g:darkslate_improved_warnings')
  let g:darkslate_improved_warnings=0
endif

if !exists('g:darkslate_termcolors')
  let g:darkslate_termcolors=256
endif

if !exists('g:darkslate_invert_indent_guides')
  let g:darkslate_invert_indent_guides=0
endif

if !exists('g:darkslate_contrast_dark')
  let g:darkslate_contrast_dark='medium'
endif

if !exists('g:darkslate_contrast_light')
  let g:darkslate_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

let s:ds = {}

" Backgrounds — stepped from darkest to lightest
let s:ds.dark0_hard  = ['#0a0b12', 232]   " deeper than primary bg
let s:ds.dark0       = ['#10111a', 233]   " primary.background
let s:ds.dark0_soft  = ['#14162a', 234]   " lifted bg
let s:ds.dark1       = ['#1c1e2e', 234]   " normal black — modeline, sidebars
let s:ds.dark2       = ['#252848', 235]   " selection.background
let s:ds.dark3       = ['#2e3055', 236]   " hl-line, panels
let s:ds.dark4       = ['#3a3d58', 60]    " panel borders / bright black

let s:ds.gray_245    = ['#5a6080', 61]    " comments, line-numbers
let s:ds.gray_244    = ['#5a6080', 61]

" Foregrounds — stepped from brightest to dimmest
let s:ds.light0_hard = ['#f0f2ff', 255]   " brightest white
let s:ds.light0      = ['#e4e6f8', 255]   " primary foreground
let s:ds.light0_soft = ['#e4e6f8', 255]
let s:ds.light1      = ['#ccd0e8', 189]   " bright white / secondary fg
let s:ds.light2      = ['#b8bcd8', 146]   " dimmer fg
let s:ds.light3      = ['#9098b8', 104]   " muted fg
let s:ds.light4      = ['#8890a8', 103]   " faint / normal white

" Accent colours — vivid, high-contrast against the dark navy base
let s:ds.bright_red     = ['#f06870', 203]  " errors
let s:ds.bright_green   = ['#68d880', 114]  " strings
let s:ds.bright_yellow  = ['#e8c050', 221]  " types
let s:ds.bright_blue    = ['#70a8f0', 111]  " keywords
let s:ds.bright_purple  = ['#c078e8', 177]  " constants
let s:ds.bright_aqua    = ['#58c8e8', 117]  " functions
let s:ds.bright_orange  = ['#e08040', 208]  " preprocessor

let s:ds.neutral_red    = ['#d84848', 167]
let s:ds.neutral_green  = ['#48b860', 71]
let s:ds.neutral_yellow = ['#c8a030', 178]
let s:ds.neutral_blue   = ['#4880c8', 68]
let s:ds.neutral_purple = ['#9048c0', 97]
let s:ds.neutral_aqua   = ['#3098b8', 67]
let s:ds.neutral_orange = ['#b06030', 130]

let s:ds.faded_red      = ['#882030', 88]
let s:ds.faded_green    = ['#286840', 22]
let s:ds.faded_yellow   = ['#786020', 58]
let s:ds.faded_blue     = ['#204888', 24]
let s:ds.faded_purple   = ['#502870', 54]
let s:ds.faded_aqua     = ['#185878', 23]
let s:ds.faded_orange   = ['#784020', 94]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:darkslate_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:darkslate_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:darkslate_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:darkslate_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:darkslate_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

if s:is_dark
  let s:bg0  = s:ds.dark0
  if g:darkslate_contrast_dark == 'soft'
    let s:bg0  = s:ds.dark0_soft
  elseif g:darkslate_contrast_dark == 'hard'
    let s:bg0  = s:ds.dark0_hard
  endif

  let s:bg1  = s:ds.dark1
  let s:bg2  = s:ds.dark2
  let s:bg3  = s:ds.dark3
  let s:bg4  = s:ds.dark4

  let s:gray = s:ds.gray_245

  let s:fg0 = s:ds.light0
  let s:fg1 = s:ds.light1
  let s:fg2 = s:ds.light2
  let s:fg3 = s:ds.light3
  let s:fg4 = s:ds.light4

  let s:fg4_256 = s:ds.light4

  let s:red    = s:ds.bright_red
  let s:green  = s:ds.bright_green
  let s:yellow = s:ds.bright_yellow
  let s:blue   = s:ds.bright_blue
  let s:purple = s:ds.bright_purple
  let s:aqua   = s:ds.bright_aqua
  let s:orange = s:ds.bright_orange
else
  let s:bg0  = s:ds.light0
  if g:darkslate_contrast_light == 'soft'
    let s:bg0  = s:ds.light0_soft
  elseif g:darkslate_contrast_light == 'hard'
    let s:bg0  = s:ds.light0_hard
  endif

  let s:bg1  = s:ds.light1
  let s:bg2  = s:ds.light2
  let s:bg3  = s:ds.light3
  let s:bg4  = s:ds.light4

  let s:gray = s:ds.gray_244

  let s:fg0 = s:ds.dark0
  let s:fg1 = s:ds.dark1
  let s:fg2 = s:ds.dark2
  let s:fg3 = s:ds.dark3
  let s:fg4 = s:ds.dark4

  let s:fg4_256 = s:ds.dark4

  let s:red    = s:ds.faded_red
  let s:green  = s:ds.faded_green
  let s:yellow = s:ds.faded_yellow
  let s:blue   = s:ds.faded_blue
  let s:purple = s:ds.faded_purple
  let s:aqua   = s:ds.faded_aqua
  let s:orange = s:ds.faded_orange
endif

if g:darkslate_termcolors == 16
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

let s:ds.bg0 = s:bg0
let s:ds.bg1 = s:bg1
let s:ds.bg2 = s:bg2
let s:ds.bg3 = s:bg3
let s:ds.bg4 = s:bg4

let s:ds.gray = s:gray

let s:ds.fg0 = s:fg0
let s:ds.fg1 = s:fg1
let s:ds.fg2 = s:fg2
let s:ds.fg3 = s:fg3
let s:ds.fg4 = s:fg4

let s:ds.fg4_256 = s:fg4_256

let s:ds.red    = s:red
let s:ds.green  = s:green
let s:ds.yellow = s:yellow
let s:ds.blue   = s:blue
let s:ds.purple = s:purple
let s:ds.aqua   = s:aqua
let s:ds.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0  = s:bg0[0]
  let g:terminal_color_8  = s:gray[0]

  let g:terminal_color_1  = s:ds.neutral_red[0]
  let g:terminal_color_9  = s:red[0]

  let g:terminal_color_2  = s:ds.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3  = s:ds.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4  = s:ds.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5  = s:ds.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6  = s:ds.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7  = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:darkslate_hls_cursor')
  let s:hls_cursor = get(s:ds, g:darkslate_hls_cursor)
endif

let s:number_column = s:none
if exists('g:darkslate_number_column')
  let s:number_column = get(s:ds, g:darkslate_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:darkslate_sign_column')
    let s:sign_column = get(s:ds, g:darkslate_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:darkslate_color_column')
  let s:color_column = get(s:ds, g:darkslate_color_column)
endif

let s:vert_split = s:bg0
if exists('g:darkslate_vert_split')
  let s:vert_split = get(s:ds, g:darkslate_vert_split)
endif

let s:invert_signs = ''
if exists('g:darkslate_invert_signs')
  if g:darkslate_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:darkslate_invert_selection')
  if g:darkslate_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:darkslate_invert_tabline')
  if g:darkslate_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:darkslate_italicize_comments')
  if g:darkslate_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:darkslate_italicize_strings')
  if g:darkslate_italicize_strings == 1
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
    if g:darkslate_guisp_fallback != 'NONE'
      let fg = a:3
    endif
    if g:darkslate_guisp_fallback == 'bg'
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
" DarkSlate Hi Groups: {{{

call s:HL('DarkSlateFg0', s:fg0)
call s:HL('DarkSlateFg1', s:fg1)
call s:HL('DarkSlateFg2', s:fg2)
call s:HL('DarkSlateFg3', s:fg3)
call s:HL('DarkSlateFg4', s:fg4)
call s:HL('DarkSlateGray', s:gray)
call s:HL('DarkSlateBg0', s:bg0)
call s:HL('DarkSlateBg1', s:bg1)
call s:HL('DarkSlateBg2', s:bg2)
call s:HL('DarkSlateBg3', s:bg3)
call s:HL('DarkSlateBg4', s:bg4)

call s:HL('DarkSlateRed', s:red)
call s:HL('DarkSlateRedBold', s:red, s:none, s:bold)
call s:HL('DarkSlateGreen', s:green)
call s:HL('DarkSlateGreenBold', s:green, s:none, s:bold)
call s:HL('DarkSlateYellow', s:yellow)
call s:HL('DarkSlateYellowBold', s:yellow, s:none, s:bold)
call s:HL('DarkSlateBlue', s:blue)
call s:HL('DarkSlateBlueBold', s:blue, s:none, s:bold)
call s:HL('DarkSlatePurple', s:purple)
call s:HL('DarkSlatePurpleBold', s:purple, s:none, s:bold)
call s:HL('DarkSlateAqua', s:aqua)
call s:HL('DarkSlateAquaBold', s:aqua, s:none, s:bold)
call s:HL('DarkSlateOrange', s:orange)
call s:HL('DarkSlateOrangeBold', s:orange, s:none, s:bold)

call s:HL('DarkSlateRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('DarkSlateGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('DarkSlateYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('DarkSlateBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('DarkSlatePurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('DarkSlateAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('DarkSlateOrangeSign', s:orange, s:sign_column, s:invert_signs)

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

hi! link NonText DarkSlateBg3
hi! link SpecialKey DarkSlateBg3

call s:HL('Visual',    s:none,  s:bg2, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg0, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

call s:HL('VertSplit', s:bg3, s:vert_split)

call s:HL('WildMenu', s:blue, s:bg2, s:bold)

hi! link Directory DarkSlateAquaBold
hi! link Title DarkSlateBlueBold

call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
hi! link MoreMsg DarkSlateYellowBold
hi! link ModeMsg DarkSlateYellowBold
hi! link Question DarkSlateOrangeBold
hi! link WarningMsg DarkSlateRedBold

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

if g:darkslate_improved_strings == 0
  hi! link Special DarkSlateOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

hi! link Statement DarkSlateBlue
hi! link Conditional DarkSlateBlue
hi! link Repeat DarkSlateBlue
hi! link Label DarkSlateBlue
hi! link Exception DarkSlateRed
hi! link Operator Normal
hi! link Keyword DarkSlateBlue

hi! link Identifier DarkSlateFg1
hi! link Function DarkSlateAquaBold

hi! link PreProc DarkSlateOrange
hi! link Include DarkSlateOrange
hi! link Define DarkSlateOrange
hi! link Macro DarkSlateOrange
hi! link PreCondit DarkSlateOrange

hi! link Constant DarkSlatePurple
hi! link Character DarkSlatePurple
if g:darkslate_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
hi! link Boolean DarkSlatePurple
hi! link Number DarkSlatePurple
hi! link Float DarkSlatePurple

hi! link Type DarkSlateYellow
hi! link StorageClass DarkSlateOrange
hi! link Structure DarkSlateAqua
hi! link Typedef DarkSlateYellow

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
  if g:darkslate_improved_warnings == 0
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
  if g:darkslate_invert_indent_guides == 0
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
      \ ['blue', '#204888'], ['magenta', '#502870'],
      \ ['red',  '#882030'], ['179',     '#786020']
    \ ]
endif

let g:rainbow_guifgs = [ '#786020', '#882030', '#502870', '#204888' ]
let g:rainbow_ctermfgs = [ '178', '167', '97', '68' ]

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

hi! link GitGutterAdd DarkSlateGreenSign
hi! link GitGutterChange DarkSlateAquaSign
hi! link GitGutterDelete DarkSlateRedSign
hi! link GitGutterChangeDelete DarkSlateAquaSign

" }}}
" GitCommit: {{{

hi! link gitcommitSelectedFile DarkSlateGreen
hi! link gitcommitDiscardedFile DarkSlateRed

" }}}
" Signify: {{{

hi! link SignifySignAdd DarkSlateGreenSign
hi! link SignifySignChange DarkSlateAquaSign
hi! link SignifySignDelete DarkSlateRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign DarkSlateRedSign
hi! link SyntasticWarningSign DarkSlateYellowSign

" }}}
" Signature: {{{

hi! link SignatureMarkText   DarkSlateBlueSign
hi! link SignatureMarkerText DarkSlatePurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl DarkSlateBlueSign
hi! link ShowMarksHLu DarkSlateBlueSign
hi! link ShowMarksHLo DarkSlateBlueSign
hi! link ShowMarksHLm DarkSlateBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch DarkSlateYellow
hi! link CtrlPNoEntries DarkSlateRed
hi! link CtrlPPrtBase DarkSlateBg2
hi! link CtrlPPrtCursor DarkSlateBlue
hi! link CtrlPLinePre DarkSlateBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket DarkSlateFg3
hi! link StartifyFile DarkSlateFg1
hi! link StartifyNumber DarkSlateBlue
hi! link StartifyPath DarkSlateGray
hi! link StartifySlash DarkSlateGray
hi! link StartifySection DarkSlateYellow
hi! link StartifySpecial DarkSlateBg2
hi! link StartifyHeader DarkSlateAqua
hi! link StartifyFooter DarkSlateBg2

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

hi! link ALEErrorSign DarkSlateRedSign
hi! link ALEWarningSign DarkSlateYellowSign
hi! link ALEInfoSign DarkSlateBlueSign

hi! link ALEWarning DarkSlateYellowBold
hi! link ALEError DarkSlateRedBold

" }}}
" Dirvish: {{{

hi! link DirvishPathTail DarkSlateAqua
hi! link DirvishArg DarkSlateYellow

" }}}
" Netrw: {{{

hi! link netrwDir DarkSlateAqua
hi! link netrwClassify DarkSlateAqua
hi! link netrwLink DarkSlateGray
hi! link netrwSymLink DarkSlateFg1
hi! link netrwExe DarkSlateYellow
hi! link netrwComment DarkSlateGray
hi! link netrwList DarkSlateBlue
hi! link netrwHelpCmd DarkSlateAqua
hi! link netrwCmdSep DarkSlateFg3
hi! link netrwVersion DarkSlateGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir DarkSlateAqua
hi! link NERDTreeDirSlash DarkSlateAqua

hi! link NERDTreeOpenable DarkSlateBlue
hi! link NERDTreeClosable DarkSlateBlue

hi! link NERDTreeFile DarkSlateFg1
hi! link NERDTreeExecFile DarkSlateYellow

hi! link NERDTreeUp DarkSlateGray
hi! link NERDTreeCWD DarkSlateAqua
hi! link NERDTreeHelp DarkSlateFg1

hi! link NERDTreeToggleOn DarkSlateGreen
hi! link NERDTreeToggleOff DarkSlateRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign DarkSlateRedSign
hi! link CocWarningSign DarkSlateOrangeSign
hi! link CocInfoSign DarkSlateYellowSign
hi! link CocHintSign DarkSlateBlueSign
hi! link CocErrorFloat DarkSlateRed
hi! link CocWarningFloat DarkSlateOrange
hi! link CocInfoFloat DarkSlateYellow
hi! link CocHintFloat DarkSlateBlue
hi! link CocDiagnosticsError DarkSlateRed
hi! link CocDiagnosticsWarning DarkSlateOrange
hi! link CocDiagnosticsInfo DarkSlateYellow
hi! link CocDiagnosticsHint DarkSlateBlue

hi! link CocSelectedText DarkSlateRed
hi! link CocCodeLens DarkSlateGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded DarkSlateGreen
hi! link diffRemoved DarkSlateRed
hi! link diffChanged DarkSlateAqua

hi! link diffFile DarkSlateOrange
hi! link diffNewFile DarkSlateYellow

hi! link diffLine DarkSlateBlue

" }}}
" Html: {{{

hi! link htmlTag DarkSlateBlue
hi! link htmlEndTag DarkSlateBlue
hi! link htmlTagName DarkSlateAquaBold
hi! link htmlArg DarkSlateAqua
hi! link htmlScriptTag DarkSlatePurple
hi! link htmlTagN DarkSlateFg1
hi! link htmlSpecialTagName DarkSlateAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar DarkSlateOrange

call s:HL('htmlBold', s:vim_bg, s:vim_fg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_bg, s:vim_fg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_bg, s:vim_fg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_bg, s:vim_fg, s:bold . s:underline . s:italic)
call s:HL('htmlUnderline', s:vim_bg, s:vim_fg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_bg, s:vim_fg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_bg, s:vim_fg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag DarkSlateBlue
hi! link xmlEndTag DarkSlateBlue
hi! link xmlTagName DarkSlateBlue
hi! link xmlEqual DarkSlateBlue
hi! link docbkKeyword DarkSlateAquaBold

hi! link xmlDocTypeDecl DarkSlateGray
hi! link xmlDocTypeKeyword DarkSlatePurple
hi! link xmlCdataStart DarkSlateGray
hi! link xmlCdataCdata DarkSlatePurple
hi! link dtdFunction DarkSlateGray
hi! link dtdTagName DarkSlatePurple

hi! link xmlAttrib DarkSlateAqua
hi! link xmlProcessingDelim DarkSlateGray
hi! link xmlAttribPunct DarkSlateGray

hi! link xmlEntity DarkSlateOrange
hi! link xmlEntityPunct DarkSlateOrange

" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italic)

hi! link vimNotation DarkSlateOrange
hi! link vimBracket DarkSlateOrange
hi! link vimMapModKey DarkSlateOrange
hi! link vimFuncSID DarkSlateFg3
hi! link vimSetSep DarkSlateFg3
hi! link vimSep DarkSlateFg3
hi! link vimContinue DarkSlateFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword DarkSlateBlue
hi! link clojureCond DarkSlateOrange
hi! link clojureSpecial DarkSlateOrange
hi! link clojureDefine DarkSlateOrange

hi! link clojureFunc DarkSlateYellow
hi! link clojureRepeat DarkSlateYellow
hi! link clojureCharacter DarkSlateAqua
hi! link clojureStringEscape DarkSlateAqua
hi! link clojureException DarkSlateRed

hi! link clojureRegexp DarkSlateAqua
hi! link clojureRegexpEscape DarkSlateAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen DarkSlateFg3
hi! link clojureAnonArg DarkSlateYellow
hi! link clojureVariable DarkSlateBlue
hi! link clojureMacro DarkSlateOrange

hi! link clojureMeta DarkSlateYellow
hi! link clojureDeref DarkSlateYellow
hi! link clojureQuote DarkSlateYellow
hi! link clojureUnquote DarkSlateYellow

" }}}
" C: {{{

hi! link cOperator DarkSlatePurple
hi! link cStructure DarkSlateOrange

" }}}
" Python: {{{

hi! link pythonBuiltin DarkSlateOrange
hi! link pythonBuiltinObj DarkSlateOrange
hi! link pythonBuiltinFunc DarkSlateOrange
hi! link pythonFunction DarkSlateAqua
hi! link pythonDecorator DarkSlateBlue
hi! link pythonInclude DarkSlateBlue
hi! link pythonImport DarkSlateBlue
hi! link pythonRun DarkSlateBlue
hi! link pythonCoding DarkSlateBlue
hi! link pythonOperator DarkSlateRed
hi! link pythonException DarkSlateRed
hi! link pythonExceptions DarkSlatePurple
hi! link pythonBoolean DarkSlatePurple
hi! link pythonDot DarkSlateFg3
hi! link pythonConditional DarkSlateBlue
hi! link pythonRepeat DarkSlateBlue
hi! link pythonDottedName DarkSlateGreenBold

" }}}
" CSS: {{{

hi! link cssBraces DarkSlateBlue
hi! link cssFunctionName DarkSlateYellow
hi! link cssIdentifier DarkSlateOrange
hi! link cssClassName DarkSlateGreen
hi! link cssColor DarkSlateBlue
hi! link cssSelectorOp DarkSlateBlue
hi! link cssSelectorOp2 DarkSlateBlue
hi! link cssImportant DarkSlateGreen
hi! link cssVendor DarkSlateFg1

hi! link cssTextProp DarkSlateAqua
hi! link cssAnimationProp DarkSlateAqua
hi! link cssUIProp DarkSlateYellow
hi! link cssTransformProp DarkSlateAqua
hi! link cssTransitionProp DarkSlateAqua
hi! link cssPrintProp DarkSlateAqua
hi! link cssPositioningProp DarkSlateYellow
hi! link cssBoxProp DarkSlateAqua
hi! link cssFontDescriptorProp DarkSlateAqua
hi! link cssFlexibleBoxProp DarkSlateAqua
hi! link cssBorderOutlineProp DarkSlateAqua
hi! link cssBackgroundProp DarkSlateAqua
hi! link cssMarginProp DarkSlateAqua
hi! link cssListProp DarkSlateAqua
hi! link cssTableProp DarkSlateAqua
hi! link cssFontProp DarkSlateAqua
hi! link cssPaddingProp DarkSlateAqua
hi! link cssDimensionProp DarkSlateAqua
hi! link cssRenderProp DarkSlateAqua
hi! link cssColorProp DarkSlateAqua
hi! link cssGeneratedContentProp DarkSlateAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces DarkSlateFg1
hi! link javaScriptFunction DarkSlateAqua
hi! link javaScriptIdentifier DarkSlateBlue
hi! link javaScriptMember DarkSlateBlue
hi! link javaScriptNumber DarkSlatePurple
hi! link javaScriptNull DarkSlatePurple
hi! link javaScriptParens DarkSlateFg3

" }}}
" YAJS: {{{

hi! link javascriptImport DarkSlateAqua
hi! link javascriptExport DarkSlateAqua
hi! link javascriptClassKeyword DarkSlateAqua
hi! link javascriptClassExtends DarkSlateAqua
hi! link javascriptDefault DarkSlateAqua

hi! link javascriptClassName DarkSlateYellow
hi! link javascriptClassSuperName DarkSlateYellow
hi! link javascriptGlobal DarkSlateYellow

hi! link javascriptEndColons DarkSlateFg1
hi! link javascriptFuncArg DarkSlateFg1
hi! link javascriptGlobalMethod DarkSlateFg1
hi! link javascriptNodeGlobal DarkSlateFg1

hi! link javascriptBracket DarkSlateFg1
hi! link javascriptOpSymbol DarkSlateFg1
hi! link javascriptOpSymbols DarkSlateFg1
hi! link javascriptIdentifierName DarkSlateFg1
hi! link javascriptVariable DarkSlateOrange
hi! link javascriptIdentifier DarkSlateOrange
hi! link javascriptClassSuper DarkSlateOrange
hi! link javascriptFuncKeyword DarkSlateOrange
hi! link javascriptAsyncFunc DarkSlateOrange
hi! link javascriptClassStatic DarkSlateOrange

hi! link javascriptOperator DarkSlateRed
hi! link javascriptForOperator DarkSlateRed
hi! link javascriptYield DarkSlateRed
hi! link javascriptExceptions DarkSlateRed
hi! link javascriptMessage DarkSlateRed

hi! link javascriptTemplateSB DarkSlateAqua
hi! link javascriptTemplateSubstitution DarkSlateAqua

hi! link javascriptLabel DarkSlateBlue
hi! link javascriptObjectLabel DarkSlateBlue
hi! link javascriptPropertyName DarkSlateBlue

hi! link javascriptLogicSymbols DarkSlateBlue
hi! link javascriptArrowFunc DarkSlateYellow

hi! link javascriptDocParamName DarkSlateBlue
hi! link javascriptDocTags DarkSlateBlue
hi! link javascriptDocNotation DarkSlateBlue
hi! link javascriptDocParamType DarkSlateBlue
hi! link javascriptDocNamedParamType DarkSlateBlue

hi! link javascriptBrackets DarkSlateFg1
hi! link javascriptDOMElemAttrs DarkSlateFg1
hi! link javascriptDOMEventMethod DarkSlateFg1
hi! link javascriptDOMNodeMethod DarkSlateFg1
hi! link javascriptDOMStorageMethod DarkSlateFg1
hi! link javascriptDateMethod DarkSlateFg1
hi! link javascriptArrayMethod DarkSlateFg1
hi! link javascriptNumberMethod DarkSlateFg1
hi! link javascriptStringMethod DarkSlateFg1
hi! link javascriptURLMethod DarkSlateFg1
hi! link javascriptFunctionMethod DarkSlateFg1
hi! link javascriptJSONMethod DarkSlateFg1

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword DarkSlateAqua
hi! link jsExtendsKeyword DarkSlateAqua
hi! link jsExportDefault DarkSlateAqua
hi! link jsTemplateBraces DarkSlateAqua
hi! link jsGlobalNodeObjects DarkSlateFg1
hi! link jsGlobalObjects DarkSlateFg1
hi! link jsFunction DarkSlateOrange
hi! link jsFuncParens DarkSlateFg3
hi! link jsParens DarkSlateFg3
hi! link jsNull DarkSlatePurple
hi! link jsUndefined DarkSlatePurple
hi! link jsClassDefinition DarkSlateYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved DarkSlateAqua
hi! link typeScriptLabel DarkSlateAqua
hi! link typeScriptFuncKeyword DarkSlateAqua
hi! link typeScriptIdentifier DarkSlateOrange
hi! link typeScriptBraces DarkSlateFg1
hi! link typeScriptEndColons DarkSlateFg1
hi! link typeScriptDOMObjects DarkSlateFg1
hi! link typeScriptAjaxMethods DarkSlateFg1
hi! link typeScriptLogicSymbols DarkSlateFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects DarkSlateFg1
hi! link typeScriptParens DarkSlateFg3
hi! link typeScriptOpSymbols DarkSlateFg3
hi! link typeScriptHtmlElemProperties DarkSlateFg1
hi! link typeScriptNull DarkSlatePurple
hi! link typeScriptInterpolationDelimiter DarkSlateAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword DarkSlateAqua
hi! link purescriptModuleName DarkSlateFg1
hi! link purescriptWhere DarkSlateAqua
hi! link purescriptDelimiter DarkSlateFg4
hi! link purescriptType DarkSlateFg1
hi! link purescriptImportKeyword DarkSlateAqua
hi! link purescriptHidingKeyword DarkSlateAqua
hi! link purescriptAsKeyword DarkSlateAqua
hi! link purescriptStructure DarkSlateAqua
hi! link purescriptOperator DarkSlateBlue

hi! link purescriptTypeVar DarkSlateFg1
hi! link purescriptConstructor DarkSlateFg1
hi! link purescriptFunction DarkSlateFg1
hi! link purescriptConditional DarkSlateOrange
hi! link purescriptBacktick DarkSlateOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp DarkSlateFg3
hi! link coffeeSpecialOp DarkSlateFg3
hi! link coffeeCurly DarkSlateOrange
hi! link coffeeParen DarkSlateFg3
hi! link coffeeBracket DarkSlateOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter DarkSlateGreen
hi! link rubyInterpolationDelimiter DarkSlateAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier DarkSlateRed
hi! link objcDirective DarkSlateBlue

" }}}
" Go: {{{

hi! link goDirective DarkSlateAqua
hi! link goConstants DarkSlatePurple
hi! link goDeclaration DarkSlateBlue
hi! link goDeclType DarkSlateBlue
hi! link goBuiltins DarkSlateOrange

" }}}
" Lua: {{{

hi! link luaIn DarkSlateBlue
hi! link luaFunction DarkSlateAqua
hi! link luaTable DarkSlateOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp DarkSlateFg3
hi! link moonExtendedOp DarkSlateFg3
hi! link moonFunction DarkSlateFg3
hi! link moonObject DarkSlateYellow

" }}}
" Java: {{{

hi! link javaAnnotation DarkSlateBlue
hi! link javaDocTags DarkSlateAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen DarkSlateFg3
hi! link javaParen1 DarkSlateFg3
hi! link javaParen2 DarkSlateFg3
hi! link javaParen3 DarkSlateFg3
hi! link javaParen4 DarkSlateFg3
hi! link javaParen5 DarkSlateFg3
hi! link javaOperator DarkSlateOrange

hi! link javaVarArg DarkSlateGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter DarkSlateGreen
hi! link elixirInterpolationDelimiter DarkSlateAqua

hi! link elixirModuleDeclaration DarkSlateYellow

" }}}
" Scala: {{{

hi! link scalaNameDefinition DarkSlateFg1
hi! link scalaCaseFollowing DarkSlateFg1
hi! link scalaCapitalWord DarkSlateFg1
hi! link scalaTypeExtension DarkSlateFg1

hi! link scalaKeyword DarkSlateBlue
hi! link scalaKeywordModifier DarkSlateBlue

hi! link scalaSpecial DarkSlateAqua
hi! link scalaOperator DarkSlateFg1

hi! link scalaTypeDeclaration DarkSlateYellow
hi! link scalaTypeTypePostDeclaration DarkSlateYellow

hi! link scalaInstanceDeclaration DarkSlateFg1
hi! link scalaInterpolation DarkSlateAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 DarkSlateBlueBold
hi! link markdownH2 DarkSlateBlueBold
hi! link markdownH3 DarkSlateAquaBold
hi! link markdownH4 DarkSlateAquaBold
hi! link markdownH5 DarkSlateAqua
hi! link markdownH6 DarkSlateAqua

hi! link markdownCode DarkSlateYellow
hi! link markdownCodeBlock DarkSlateYellow
hi! link markdownCodeDelimiter DarkSlateYellow

hi! link markdownBlockquote DarkSlateGray
hi! link markdownListMarker DarkSlateGray
hi! link markdownOrderedListMarker DarkSlateGray
hi! link markdownRule DarkSlateGray
hi! link markdownHeadingRule DarkSlateGray

hi! link markdownUrlDelimiter DarkSlateFg3
hi! link markdownLinkDelimiter DarkSlateFg3
hi! link markdownLinkTextDelimiter DarkSlateFg3

hi! link markdownHeadingDelimiter DarkSlateOrange
hi! link markdownUrl DarkSlatePurple
hi! link markdownUrlTitleDelimiter DarkSlateGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

hi! link haskellType DarkSlateFg1
hi! link haskellIdentifier DarkSlateFg1
hi! link haskellSeparator DarkSlateFg1
hi! link haskellDelimiter DarkSlateFg4
hi! link haskellOperators DarkSlateBlue

hi! link haskellBacktick DarkSlateOrange
hi! link haskellStatement DarkSlateOrange
hi! link haskellConditional DarkSlateOrange

hi! link haskellLet DarkSlateAqua
hi! link haskellDefault DarkSlateAqua
hi! link haskellWhere DarkSlateAqua
hi! link haskellBottom DarkSlateAqua
hi! link haskellBlockKeywords DarkSlateAqua
hi! link haskellImportKeywords DarkSlateAqua
hi! link haskellDeclKeyword DarkSlateAqua
hi! link haskellDeriving DarkSlateAqua
hi! link haskellAssocType DarkSlateAqua

hi! link haskellNumber DarkSlatePurple
hi! link haskellPragma DarkSlatePurple

hi! link haskellString DarkSlateGreen
hi! link haskellChar DarkSlateGreen

" }}}
" Json: {{{

hi! link jsonKeyword DarkSlateGreen
hi! link jsonQuote DarkSlateGreen
hi! link jsonBraces DarkSlateFg1
hi! link jsonString DarkSlateFg1

" }}}
" Rust: {{{

hi! link rustPubScopeCrate DarkSlateAqua

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
