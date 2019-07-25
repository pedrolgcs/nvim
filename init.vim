" Author: Pedro Henrique
" Souce: https://github.com/pedrolgcs

" LEADER KEY
let mapleader="\<space>"

" COMPATIBILITY
" Set 'nocompatible' to avoid unexpected things that your distro might have
set nocompatible
set t_ut=

" Configure vim-plug
call plug#begin('~/.config/nvim/bundle')

  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
  Plug 'sheerun/vim-polyglot'

  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tomasr/molokai'

  Plug 'vim-syntastic/syntastic'

  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'w0rp/ale'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mattn/emmet-vim'
  Plug 'vim-airline/vim-airline'

  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'

call plug#end()

" MOVING BETWEEN FILES
" Set 'hidden' if you want to open a new file inside the same buffer without the
" need to save it first (if there's any unsaved changes).
set hidden

" SYNTAX
" Enable syntax highlighting
syntax on
set guicursor=n:blinkon1

" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" Make Ag search from your project root
let g:ag_working_path_mode="r"

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2

" FONT
set guifont=Monaco\ for\ Powerline:h12

" COLOR SCHEME
" color dracula
colorscheme molokai
set termguicolors
set t_Co=256

" ENCODING
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu

" FILE NUMBERS
" Enable relative and absolute file numbers
set number relativenumber

" WRAP
" Stop wrapping long lines
set nowrap

" AUTORELOAD
" Automatically reload buffers when file changes
set autoread

" Show preview
set inccommand=split

" Custom commands
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>p :vsplit <bar> :Files<cr>

" PLUGINS CONFIGURATIONS
" syntastic - eslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let b:ale_fixers = ['eslint']

let g:NERDSpaceDelims = 1
