let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/epub-tui-reader
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +1 ~/Documents/VPN_SETUP/publickey
badd +27 ~/.vimrc
badd +51 epub-reader_01.py
badd +12 inspection.txt
badd +1 epub-reader.py
badd +9 ~/.config/hypr/hyprpaper.conf
badd +1 ~/Documents/dracula2.qbtheme
badd +2 ~/Documents/dracula.qbtheme
badd +207 ~/Downloads/Sagssystem-master/Flaskapp/webfunc.py
badd +102 ~/Downloads/Sagssystem-master/Flaskapp/app.py
badd +298 ~/Documents/Misc_notes/.obsidian/themes/Inkveil/theme.css
badd +33 ~/.config/alacritty/inkveil.toml
badd +15 ~/Documents/custom_homepage/homepage.html
badd +1 ~/.config/ironbar/config.json
badd +40 ~/.config/ironbar/style.css
badd +6 ~/.config/zathura/zathurarc
badd +1 ~/.config/zathura/style.css
badd +106 ~/.config/hypr/hyprland.conf
badd +4 ~/Documents/startmenu_program/startmenu.json
badd +80 ~/Documents/startmenu_program/startmenu.py
badd +18 ~/.config/nwg-dock-hyprland/style.css
argglobal
%argdel
$argadd epub-reader_01.py
edit ~/.config/ironbar/config.json
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 155 + 155) / 311)
exe 'vert 2resize ' . ((&columns * 155 + 155) / 311)
argglobal
balt ~/.config/hypr/hyprland.conf
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 16 - ((15 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 013|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/ironbar/style.css", ":p")) | buffer ~/.config/ironbar/style.css | else | edit ~/.config/ironbar/style.css | endif
balt ~/Documents/VPN_SETUP/publickey
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 183 - ((46 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 183
normal! 011|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 155 + 155) / 311)
exe 'vert 2resize ' . ((&columns * 155 + 155) / 311)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
