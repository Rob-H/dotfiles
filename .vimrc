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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'digitaltoad/vim-pug'

"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

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

set number
set relativenumber
set hidden
set wildignore+=node_modules/**
set wildignore+=coverage/**
set wildignore+=tags
set wildignore+=target/**
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
  set guioptions-=r  "remove right hand scrollbar
  set guioptions-=L  "remove left hand scrollbar
  if has('win32') || has('win64')
    set guifont=Lucida_Console:h10:cANSI
  else 
    set guifont=Inconsolata \12
  endif
endif

"my mappings
map <leader>n :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <C-n> :NERDTreeToggle<cr>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"setup ctrlp to not use project specific settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = { 'dir': 'node_modules$\|coverage$\|target$', 'file': 'tags$\|\.class$' }  

"setup ale fixers
let g:ale_fixers = { 'javascript': ['eslint', 'standard'] }
let g:ale_javascript_eslint_use_global = 1
let g:ale_fix_on_save = 1

"setup ctags to use .tags aswell
set tags=./.tags,.tags,./tags,tags

set suffixesadd+=.js,.jsx

function! RemoveTrailingWhiteSpace()
  :normal mz
  :%s/\s\+$//g
  :normal 'z
  :normal zz
endfunction

command! RemoveTrailingWhiteSpace call RemoveTrailingWhiteSpace()
