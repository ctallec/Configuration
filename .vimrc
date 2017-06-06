" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'VundleVim/Vundle.vim'
" Plugins
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
" }}}

" Python plugin settings {{{
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:SimpylFold_docstring_preview=1

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
            \ set encoding=utf-8 |

autocmd FileType python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<CR>
" }}}

" Colours {{{
let python_highligh_all=1
syntax enable
" }}}

" Mouse support {{{
set mouse=a
" }}}

" Spaces and Tabs {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set modelines=1
set autoindent
" }}}

" Change colorscheme {{{
colorscheme zenburn
" }}}

" UI Layout {{{
set number
set showcmd
set wildmenu
set showmatch
" }}}

" Copy paste directly into the system clipboard {{{
set clipboard=unnamedplus
" }}}

" Let me be more liberal with my buffers {{{
set hidden
" }}}

" Necessary short cuts {{{
let mapleader="\<Space>"
let maplocalleader="\<Space>"
inoremap jk <esc>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>m :make
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>q :q<CR>

map <C-n> :NERDTreeToggle<CR> 
" }}}

" Handling latex {{{
nnoremap <leader>ll :!pdflatex %<CR>
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Lua file settings {{{
augroup filetype_lua
    autocmd!
    autocmd Filetype lua setlocal foldmethod=indent
    if !exists("g:th_cmd")
        let g:th_cmd = 'qlua -lenv'
    endif

    function! TorchExec()
        silent !clear
        execute 'silent !gnome-terminal -x zsh -c "' . g:th_cmd . " " . bufname("%") . "; read \\?\'Press a key to continue...\'\""
        execute "redraw!"
    endfunction

    autocmd Filetype lua :nnoremap <buffer> <localleader>r :call TorchExec()<cr>
augroup END
"}}}
