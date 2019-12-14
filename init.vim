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
  " autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mattn/emmet-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'

  " File explorer
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug 'junegunn/fzf.vim'

  " interfaces
  Plug 'vim-airline/vim-airline'
  Plug 'tomasr/molokai'

  " languages
  Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'
  Plug 'ap/vim-css-color'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'othree/html5.vim'
  Plug 'ekalinin/Dockerfile.vim'

  " lint
  Plug 'dense-analysis/ale'
  " Plug 'vim-syntastic/syntastic'

  " utils
  Plug 'scrooloose/nerdcommenter'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

  " git
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'

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

" COLOR SCHEME
colorscheme molokai
set termguicolors
set t_Co=256

" ENCODING
set encoding=UTF-8

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

""""""""""""""""""""""""""""""""""""""
" Plugin NERDTree
""""""""""""""""""""""""""""""""""""""
nnoremap <C-e> :NERDTreeToggle<CR>

nnoremap <leader>m :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize=25

""""""""""""""""""""""""""""""""""""""
" Plugin css
""""""""""""""""""""""""""""""""""""""
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

""""""""""""""""""""""""""""""""""""""
" Plugin sass
""""""""""""""""""""""""""""""""""""""
autocmd FileType scss set iskeyword+=-

""""""""""""""""""""""""""""""""""""""
" Plugin ale
""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters_explicit = 1
let g:ale_linter_aliases = {'javascript': ['javascript']}
let g:ale_linters = {'javascript': ['eslint'], 'react': ['eslint']}

""""""""""""""""""""""""""""""""""""""
" Plugin COC
""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

""""""""""""""""""""""""""""""""""
" Plugin vim-airline
""""""""""""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 1

" Custom commands
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
nnoremap <c-f> :Ag<space>
nnoremap <leader>n :NERDTreeToggle<cr>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
