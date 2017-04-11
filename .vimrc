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
Plugin 'godlygeek/tabular'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'

call vundle#end()
filetype plugin indent on
" }}}

" Path changing {{{
set path +=**
" }}}

" Generate tags {{{
command! MakeTags !ctags -R .
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
filetype indent on
filetype plugin on
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
nnoremap <leader>l :set list!<CR>
" }}}

" Vim Latex {{{
set grepprg=grep\ -nH\ $*
let g:tex_flavor='pdflatex'
let g:Tex_DefaultTargetFormat='pdf'
" }}}

" Snippets configuration {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"
" }}}

" Spell checking {{{
nnoremap <silent> <leader>p :set spell!<CR>
set spelllang=en_gb
" }}}

" More or less useful remaps {{{
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
inoremap <c-u> <esc>viwUi
nnoremap <leader><c-u> viwU
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
" }}}

" Come Iab cause I'm a dumbass {{{
iabbrev ouptuts outputs
" }}}

" Automatic read of changes {{{
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set autoread
au CursorHold * checktime
" }}}

" Handling latex {{{
nnoremap <leader>ll :!pdflatex %<CR>
" }}}

" snippets {{{
augroup filetype_python
    autocmd!
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType python :iabbrev <buffer> def def ():<esc>2hi
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
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
    let g:lua_interpreter_path = '/home/tallec/torch/install/bin/qlua'
    let g:lua_internal = 0
    let g:lua_complete_dynamic = 0
    let g:lua_complete_omni = 1 
    if !exists("g:th_cmd")
        let g:th_cmd = 'th'
    endif

    function! TorchExec()
        silent !clear
        execute 'silent !gnome-terminal -x zsh -c "' . g:th_cmd . " " . bufname("%") . "; read \\?\'Press a key to continue...\'\""
        execute "redraw!"
    endfunction

    autocmd Filetype lua :nnoremap <buffer> <localleader>r :call TorchExec()<cr>
augroup END
" }}}

" Completion options {{{
set completeopt=longest,preview,menu
" }}}
