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
  Plug 'isRuslan/vim-es6'
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
  Plug 'morhetz/gruvbox'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'

  " languages
  " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'elzr/vim-json'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'ianks/vim-tsx'
  Plug 'jparise/vim-graphql'

  " utils
  Plug 'unblevable/quick-scope'
  Plug 'alvan/vim-closetag'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'tpope/vim-surround'
  Plug 'Shougo/echodoc.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'lilydjwg/colorizer'
  Plug 'ap/vim-buftabline'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-repeat'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

call plug#end()

"""""""""""""""""""""""""""""""""""
" Commons Config
"""""""""""""""""""""""""""""""""""

" MOVING BETWEEN FILES
set hidden

let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

" Collum
set colorcolumn=80

" Confirm save file
set confirm

" SYNTAX
" Enable syntax highlighting
syntax on
syntax enable
set guicursor=n:blinkon1
filetype plugin indent on

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

" Correct comment highlight
autocmd FileType json syntax match Comment +\/\/.\+$+

" Highlight from start of file for TS and JS buffers
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" AUTOCMD 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
" au BufNewFile,BufRead *.ts setlocal filetype=typescript
" au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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
set shiftround

set listchars=tab:▸\ ,eol:¬
set list

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**,.git/**

" COLOR SCHEME
if (has("termguicolors"))
 set termguicolors
 set t_Co=256
endif

colorscheme dracula
" colorscheme monokai
" colorscheme molokai

" colorscheme gruvbox
" set background=dark


" Conceal
set conceallevel=0
let g:vim_markdown_conceal=0

" ENCODING
set encoding=UTF-8
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

" Bind <F3> to clear search history "
map <F3> *:let @/=""

""""""""""""""""""""""""""""""""""""""
" quick-scope
""""""""""""""""""""""""""""""""""""""
let g:qs_highlight_on_keys = ['f', 'F']


""""""""""""""""""""""""""""""""""""""
" Vim Instant Markdown
""""""""""""""""""""""""""""""""""""""
filetype plugin on
let g:instant_markdown_slow = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.tsx'

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
  \ 'coc-spell-checker',
  \ 'coc-cspell-dicts',
  \ 'coc-pairs',
  \ 'coc-css',
  \ 'coc-json'
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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIgnore = ['^node_modules$', '\.git$', '\.vscode$']
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize= 40

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
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

" change tab
nnoremap <C-T> :bnext<CR>
nnoremap <C-B> :bprev<CR>

nnoremap <C-Q> :bdelete<CR>

map <C-s> :w<CR>
