set number relativenumber
set noshowmode
set cursorline
set noswapfile
runtime ftplugin/man.vim

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'

call plug#end()

set ttimeoutlen=50
syntax enable
set termguicolors
set background=dark
colorscheme slate_theme
let g:airline_theme='base16'
set sessionoptions+=buffers,curdir,tabpages,winsize,winpos

if has('gui_running')   
	autocmd VimLeavePre * silent! mksession! ~/.gvim_session.vim   
	autocmd VimEnter * if filereadable(expand("~/.gvim_session.vim")) | silent! source ~/.gvim_session.vim | endif 
endif
let mapleader = " "

let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>s :NERDTreeFocus<CR>:NERDTreeMenu search<CR>
nnoremap <leader>q :qa<CR>
nnoremap <leader><Left> :tabprev<CR>
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader><Up> :tabnew<CR>
nnoremap <leader><Down> :tabclose<CR>
nnoremap <leader>t :tabedit
nnoremap <leader>l :NERDTreeFocus<CR>
nnoremap <leader>k :wincmd p<CR>
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
