" Author: Pedro Henrique
" Source: https://github.com/pedrolgcs/nvim

" LEADER KEY
let mapleader="\<space>"

" --------------- Basic Setup ---------------

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set switchbuf=usetab
set guicursor=n:blinkon1
set wildignore=*.class,*.zip,*.gif,*.pyc,*.swp,*.tar.*,*.pdf,node_modules/**,.git/**
set t_Co=256

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" Syntax
filetype plugin indent on
syntax on

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
  set termguicolors
else
  if $TERM !=? 'xterm-256color'
    set termguicolors
    endif
endif

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
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}

  " File explorer
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " interfaces
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'ryanoasis/vim-devicons'

  " languages
  Plug 'sheerun/vim-polyglot'
  Plug 'plasticboy/vim-markdown'

  " utils
  Plug 'terryma/vim-multiple-cursors'
  Plug 'unblevable/quick-scope'
  Plug 'alvan/vim-closetag'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'ap/vim-css-color'

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
  \ 'coc-emmet',
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
" Markdown
""""""""""""""""""""""""""""""""""""""
let g:tex_conceal = ''
let g:vim_markdown_math = 1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

""""""""""""""""""""""""""""""""""""""
" Custom Commands
""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

" terminal
nnoremap <F6> :sp<CR>:terminal<CR>

" coc
nnoremap <leader>cr :CocRestart<cr>

" Tabs
nnoremap <S-Tab> :bnext<CR>
" nnoremap <Tab> :bnext<CR>
nnoremap <silent> <S-t> :tabnew<CR>

" save file
map <C-s> :w<CR>

" close file
map <C-Q> :bdelete<CR>

" Bind <F3> to clear search history "
map <F3> *:let @/=""

" easymotion
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>L <Plug>(easymotion-bd-jk)
