" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

set nocompatible               " be iMproved

" Vundle {

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Skin
Bundle 'godlygeek/csapprox'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'chriskempson/base16-vim'

Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'channing/vim-plugin-minibufexpl'
Bundle 'myusuf3/numbers.vim'
Bundle 'wincent/Command-T'
Bundle 'matchit.zip'
Bundle 'danro/rename.vim'
Bundle 'channing/gyp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'

Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on     " required!

" }

" { General
set rtp+=~/.my-vim/runtime

set noswapfile

" Nuke the 1 second delay for ESC
set notimeout
set ttimeout
set ttimeoutlen=100

syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set encoding=utf-8
scriptencoding utf-8

set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

autocmd FileType ruby set tabstop=2|set shiftwidth=2
au FileType ruby set softtabstop=2 tabstop=2 shiftwidth=2

"set autoindent
set smartindent

set wrap
set linebreak

" HTML
au FileType html set softtabstop=2 tabstop=2 shiftwidth=2
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head,tbody" 

" }

" UI {

set background=dark

"colorscheme base16-default
"colorscheme Tomorrow-Night
let g:solarized_termcolors=256
colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

"set showmode                    " Display the current mode
set number

set ignorecase
set smartcase
set hlsearch
set incsearch
" }

" Key Mappings {
let mapleader=","

" Clipboard
" CTRL-X Cut
vnoremap <C-X> "+x

" CTRL-C Copy
vnoremap <C-C> "+y

" CTRL-V Paste
map <C-V>		"+gP
cmap <C-V>		<C-R>+




" Ctrl+S save file
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Quotes text objects
xnoremap q i"
onoremap q i"

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH
" }

" Windows {

if has('win32') || has('win64')

" disable toolbars etc.
set go=
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

" clipboard
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
cmap <C-V> <C-R>+


"set clipboard=unnamed
endif

"  }

" Plugins {

" Powerline {
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'default_fix'
set t_Co=256
set laststatus=2
" }

" EasyMotion {
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
" }

" NerdTree {
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }

" UltiSnip {

set rtp+=~/.my-vim/
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snippets"]
let g:UltiSnipsSnippetsDir = "~/.my-vim/snippets"
let g:UltiSnipsEditSplit = "horizontal"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <silent> <leader>se :UltiSnipsEdit<CR>

autocmd BufNewFile,BufRead *.scss UltiSnipsAddFiletypes scss.css
" }

" MiniBufExpl Colors {

"hi MBEVisibleActive guifg=#A6DB29 guibg=fg
"hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
"hi MBEVisibleChanged guifg=#F1266F guibg=fg
"hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
"hi MBEChanged guifg=#CD5907 guibg=fg
"hi MBENormal guifg=#808080 guibg=fg

" }

" }
