" Author: Pedro Henrique
" Source: https://github.com/pedrolgcs/nvim

" LEADER KEY
let mapleader="\<space>"

" --------------- Basic Setup ---------------
syntax on
syntax enable
set guicursor=n:blinkon1
filetype plugin indent on
set nocompatible
set t_ut=
set confirm
set title
set number
set relativenumber
set lazyredraw
set nocursorline
set colorcolumn=80
set hlsearch
set ignorecase
set smartcase
set autoindent
set encoding=UTF-8
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set hidden
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set shortmess+=c
set wildmode=list:longest
set incsearch
set nowrap
set autoread
set foldmethod=indent   
set nofoldenable
set foldlevel=2
set list
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**,.git/**

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" --------------- Vim-Plug ---------------
call plug#begin('~/.config/nvim/bundle')

  " autocomplete
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " File explorer
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " interfaces
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'

  " languages
  Plug 'sheerun/vim-polyglot'

  " utils
  Plug 'terryma/vim-multiple-cursors'
  Plug 'unblevable/quick-scope'
  Plug 'alvan/vim-closetag'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'tpope/vim-surround'
  Plug 'Shougo/echodoc.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ap/vim-buftabline'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'easymotion/vim-easymotion'

  " git
  Plug 'airblade/vim-gitgutter'

call plug#end()

" --------------- Plugins Settings ---------------

" Make Ag search from your project root
let g:ag_working_path_mode="r"

" Theme
colorscheme dracula
set termguicolors

" Airline
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

""""""""""""""""""""""""""""""""""""""
" quick-scope
""""""""""""""""""""""""""""""""""""""
let g:qs_highlight_on_keys = ['f', 'F']

""""""""""""""""""""""""""""""""""""""
" close-tag
""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.tsx, *.jsx'

""""""""""""""""""""""""""""""""""""""
" NERD Commenter
""""""""""""""""""""""""""""""""""""""
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert

" Indentline
let g:identLine_enabled=1
autocmd Filetype json let g:indentLine_enabled = 0
nnoremap <c-k> :IndentLinesToggle<CR>

""""""""""""""""""""""""""""""""""""""
" COC
""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-styled-components',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-pairs',
  \ 'coc-css',  
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

" trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Show Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use Tab
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc Spell checker
nmap <leader>a <Plug>(coc-codeaction-selected)

""""""""""""""""""""""""""""""""""""""
" Indent Line
""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_gui = '#80ffea'
let g:indentLine_char_list = ['⎸']
let g:indentLine_enabled = 1

""""""""""""""""""""""""""""""""""""""
" DevIcons
""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

""""""""""""""""""""""""""""""""""""""
" Plugin fuzzy finder - fzf
""""""""""""""""""""""""""""""""""""""
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let $FZF_DEFAULT_COMMAND = 'ag --hidden -p ~/.config/nvim/config/fzf/.gitignore -g ""'
nnoremap <c-P> :Files<cr>
nnoremap <c-F> :Ag<cr>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>T :Tags<CR>

""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>m :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['^node_modules$', '\.git$', '\.vscode$']
let NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize= 40

""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

nnoremap <leader>cr :CocRestart<cr>

" change tab
nnoremap <C-T> :bnext<CR>
nnoremap <C-B> :bprev<CR>

" save file
map <C-s> :w<CR>

" close file
map <C-Q> :bdelete<CR>

" Bind <F3> to clear search history "
map <F3> *:let @/=""

" easymotion
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>L <Plug>(easymotion-bd-jk)

noremap <Leader>y "+y
noremap <Leader>p "+p
