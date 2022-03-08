set nocp
set encoding=utf8

"vim-plug
"source %
":PlugInstall to install plugins
":PlugUpdate to update
" comment/delete line containing plugin, reload config, then run
":PlugClean

call plug#begin()
    "theme
    Plug 'sonph/onehalf', { 'rtp': 'vim' }

    "file explorer
    Plug 'lambdalisue/fern.vim'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'

    "treesitter
"    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    "autocomplete & lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch' : 'artifacts'}
call plug#end()

" enable mouse
set mouse=a

"make nvim reload files that were changed externally
set autoread

"theme
set background=dark
colorscheme onehalfdark
set cursorline

"enable filetype plugins
filetype plugin on
filetype indent on

"set 7 lines to cursor vertically
set so=7

"make <C-BS> delete whole words in insert mode
imap <C-H> <C-W>

"wildmenu completion
set wildmenu

"syntax
syntax on

"show incomplete command
set showcmd

"show trailing whitespaces with dots
set list listchars=tab:»·,trail:·

"hybrid numbers
set nu rnu

"ruler
set ruler

"use system clipoard
set clipboard+=unnamedplus

"make backspace & movement act like it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"show matching backets
set showmatch

"spaces instead of tabs
set expandtab
set smarttab

"1tab==4spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

"set auto & smart indent
set ai
set si

"highlight search results
set hlsearch

"make search act like browser
set incsearch

"ignore case when searching
set ignorecase

"set statusline
set laststatus=2

"gui options
"if has("gui_running")

"leader bindings
let mapleader=" "
noremap <leader>h :noh<CR>
noremap <leader>e :Fern . -drawer -toggle -reveal=%<CR>

"fern config https://www.youtube.com/watch?v=oFc2kr734rs

function! s:init_fern() abort
    nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> n <Plug>(fern-action-new-path)
    nmap <buffer> d <Plug>(fern-action-remove)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> M <Plug>(fern-action-rename)
    nmap <buffer> h <Plug>(fern-action-hidden-toggle)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> k <Plug>(fern-action-mark-toggle)
    nmap <buffer> b <Plug>(fern-action-open:split)
    nmap <buffer> v <Plug>(fern-action-open:vsplit)
    nmap <buffer><nowait> < <Plug>(fern-action-leave)
    nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END

"icons
let g:fern#renderer= "nerdfont"

lua << EOF
require("user")
EOF
