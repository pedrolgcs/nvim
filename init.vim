" Author: Pedro Henrique
" Source: https://github.com/pedrolgcs/nvim

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
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " File explorer
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " interfaces
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'

  " languages
  Plug 'elzr/vim-json'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'ianks/vim-tsx'
  Plug 'jparise/vim-graphql'
  Plug 'HerringtonDarkholme/yats.vim'
  
  " utils
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'tpope/vim-surround'
  Plug 'Shougo/echodoc.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'lilydjwg/colorizer'
  " Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
  Plug 'ap/vim-buftabline'
  Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-repeat'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'

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

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

" Confirm save file
set confirm

" SYNTAX
" Enable syntax highlighting
syntax on
syntax enable
set guicursor=n:blinkon1

" SEARCH
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Make Ag search from your project root
let g:ag_working_path_mode="r"

" load syntax
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set autoindent

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noswapfile

" AUTO INDENTATION
" Enable auto indentation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**,.git/**

" COLOR SCHEME
if (has("termguicolors"))
 set termguicolors
endi

colorscheme dracula

" Conceal
set conceallevel=0
let g:vim_markdown_conceal=0

" ENCODING
set encoding=UTF-8
set guifont=FiraCode_Nerd_Font:h16
let g:airline_powerline_fonts = 1

" Displaying messages
set shortmess+=c

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
" Vim Instant Markdown
""""""""""""""""""""""""""""""""""""""
filetype plugin on
let g:instant_markdown_slow = 1

""""""""""""""""""""""""""""""""""""""
" NERD Commenter
""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""
" COC
""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-styled-components',
  \ 'coc-import-cost',
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-css'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

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
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

""""""""""""""""""""""""""""""""""""""
" Indent Line
""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_gui = '#80ffea'
let g:indentLine_char_list = ['⎸']
let g:indentLine_enabled = 1
let g:vim_json_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""
" Javascript libraries syntax
""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'jquery,react'

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

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIgnore = ['^node_modules$', '\.git$', '\.vscode$']
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize= 40
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 0

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
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
" Custom Commands
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

nnoremap <leader>cr :CocRestart<cr>

nnoremap <C-T> :bnext<CR>
nnoremap <C-B> :bprev<CR>
nnoremap <C-Q> :bdelete<CR>

map <C-s> :w<CR>
