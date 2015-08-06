if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on
syntax on

set autoread
set nowrap
 
"default tab rules
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

syntax enable

set relativenumber
set number
set hidden
set wildignore+=node_modules/**
set wildignore+=coverage/**
set wildignore+=tags
set hlsearch

" get rid of error bells!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
endif

"my mappings
map <leader>n :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <C-n> :NERDTreeToggle<cr>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"setup ctrlp to not use project specific settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = { 'dir': '\node_modules$\|\coverage$\', 'files': '\tags$\' }  

"let syntastic use jshint rather than jslint
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_enable_signs=1

command ScribeStarEditor cd D:\Work\Product\src\ScribeStar.Web\Scripts\Editor | !ctags -R --exclude=node_modules . 
command ScribeStarLolcat cd D:\Work\Product\src\ScribeStar.Web\Scripts\lolcat | !ctags -R --exclude=node_modules . 
command ScribeStarSass cd D:\Work\Product\src\ScribeStar.Web\sass
