" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'VundleVim/Vundle.vim'
" Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
" }}}

" Colours {{{
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
set term=xterm-256color
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
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
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>q :q<CR>
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
