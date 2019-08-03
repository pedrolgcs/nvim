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

  " Tree explorer
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
  " Collection of language packs
  Plug 'sheerun/vim-polyglot'
  " ES6
  Plug 'isRuslan/vim-es6'
  " Themes
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tomasr/molokai'
  " Syntax checking
  Plug 'vim-syntastic/syntastic'
  " Number line
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  " Multiple selections
  Plug 'terryma/vim-multiple-cursors'
  " File search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Lint Engine
  Plug 'w0rp/ale'
  " Close pairs
  Plug 'jiangmiao/auto-pairs'
  " Identation
  Plug 'Yggdroot/indentLine'
  " Git
  Plug 'airblade/vim-gitgutter'
  " Comments
  Plug 'scrooloose/nerdcommenter'
  " Expanding abbreviations
  Plug 'mattn/emmet-vim'
  " Status/tabline
  Plug 'vim-airline/vim-airline'
  " css color
  Plug 'ap/vim-css-color'
  " autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  " close autocomplete

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

" ignore folders nerdtree
set wildignore+=node_modules
let g:NERDTreeRespectWildIgnore = 1

" Ignore folder and files: [node_modules, .git]
command! -bang -nargs=? -complete=dir Files 
      \ call fzf#vim#files(<q-args>, {'source': 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*"', 'options': '--preview "cat {}"'}, <bang>0)

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
