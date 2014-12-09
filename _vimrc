set nocompatible
filetype off
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on
syntax on

set autoread
set nowrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

syntax enable

set number
set hidden
set wildignore+=node_modules/**

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
  set background=dark
  colorscheme solarized
endif

"my mappings
map <leader>n :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <C-n> :NERDTreeToggle<cr>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"setup ctrlp to not use project specific settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules'  


command ScribeStarStories cd D:\Work\Product\acceptance_tests\stories | !ctags -R .
command ScribeStarEditor cd D:\Work\Product\instance\ScribeStar.Web\Scripts\Editor | !ctags -R --exclude=node_modules . 
command ScribeStarSass cd D:\Work\Product\instance\ScribeStar.Web\sass
