" Author: Pedro Henrique
" Souce: https://github.com/pedrolgcs/nvim

" LEADER KEY
let mapleader="\<space>"

" COMPATIBILITY
" Set 'nocompatible' to avoid unexpected things that your distro might have
set nocompatible
set t_ut=

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "
call plug#begin('~/.config/nvim/bundle')

  " autocomplete
  Plug 'mattn/emmet-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rstacruz/vim-closer'
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " File explorer
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'christoomey/vim-tmux-navigator'

  " interfaces
  Plug 'vim-airline/vim-airline'
  Plug 'tomasr/molokai'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'

  " languages
  Plug 'sheerun/vim-polyglot'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'othree/yajs'
  Plug 'ianks/vim-tsx'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'ap/vim-css-color'
  Plug 'hail2u/vim-css3-syntax'

  " utils
  Plug 'scrooloose/nerdcommenter'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'tpope/vim-surround'
  Plug 'godlygeek/tabular'
  Plug 'Shougo/echodoc.vim'
  Plug 'editorconfig/editorconfig-vim'

  " git
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

call plug#end()

"""""""""""""""""""""""""""""""""""
" Commons Config
"""""""""""""""""""""""""""""""""""

" MOVING BETWEEN FILES
set hidden

" Confirm save file
set confirm

" SYNTAX
" Enable syntax highlighting
syntax on
set guicursor=n:blinkon1

" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" Make Ag search from your project root
let g:ag_working_path_mode="r"

" load systax
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set autoindent

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noswapfile

" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**

" COLOR SCHEME
colorscheme dracula
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
" Polyglot
""""""""""""""""""""""""""""""""""""""
" au BufEnter,BufNew *.ts let g:polyglot_disabled = ['typescript']
let g:yats_host_keyword = 1
set re=0

""""""""""""""""""""""""""""""""""""""
" NERD Commenter
""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""
" COC
""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-styled-components',
  \ 'coc-json', 
  \ 'coc-import-cost'
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

""""""""""""""""""""""""""""""""""""""
" Indent Line
""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char_list = ['⎸']

""""""""""""""""""""""""""""""""""""""
" Javascript libraries syntax
""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'jquery,underscore,backbone,react'

""""""""""""""""""""""""""""""""""""""
" DevIcons
""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call CocAction('doHover')<CR>

""""""""""""""""""""""""""""""""""""""
" AirLine
""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""
" Plugin fuzzy finder - fzf
""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <c-P> :Files<cr>
nnoremap <c-F> :Ag<cr>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>T :Tags<CR>

""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>m :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeToggle<cr>

let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize=30
let g:NERDTreeGitStatusWithFlags = 0
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#528AB3",
    \ "Staged"    : "#538B54",
    \ "Untracked" : "#BE5849",
    \ "Dirty"     : "#299999",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }

""""""""""""""""""""""""""""""""""""""
" Css
""""""""""""""""""""""""""""""""""""""
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>
map <C-s> :w<CR>
map <C-q> :quit<CR>
