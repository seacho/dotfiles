set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'Volloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ayu-theme/ayu-vim' " or other package manager

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'lervag/vimtex', { 'tag': 'v2.15' }

Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix
set bomb
set binary
set ttyfast

"显示
set scrolloff=8
set number
set relativenumber
set backspace=indent,eol,start
set tabstop=4 softtabstop=4
set shiftwidth=2
set expandtab
set cursorline          "突出显示当前行
set ruler               "打开状态栏标尺

"主题
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
syntax on

"Search
set incsearch
set hlsearch
set ignorecase
set smartcase

"窗口分割
set splitbelow
set splitright

"缩进
set autoindent
set smartindent

"Key Binding
nmap <C-t> :NERDTreeToggle<CR>

"分屏
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>
