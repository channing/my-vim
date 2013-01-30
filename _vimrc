set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'mattn/zencoding-vim.git'
Bundle 'ervandew/supertab.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'tpope/vim-rails.git'
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

syntax enable
set background=dark
colorscheme solarized

let mapleader=","

set number

set ignorecase
set hlsearch
set incsearch

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wrap
set linebreak

set clipboard=unnamed
