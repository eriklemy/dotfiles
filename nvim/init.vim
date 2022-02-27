set nocompatible            " disable compatibility to old-time vi
set number                  " add line numbers
set relativenumber          " show numbers 
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set wrap
set ttyfast                 " Speed up scrolling in Vim
syntax on                   " syntax highlighting
filetype plugin on
filetype plugin indent on   "allow auto-indenting depending on file type
" set cc=85                 " set an 80 column border for good coding style
" set cursorline            " highlight current cursorline
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files

call plug#begin()
" colorscheme 
  Plug 'dracula/vim'
  Plug 'rakr/vim-one'
  Plug 'liuchengxu/space-vim-dark'
  Plug 'joshdick/onedark.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" powerline 
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" utils 
  Plug 'gko/vim-coloresque'
  Plug 'chrisbra/Colorizer'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'                             " auto pair {(['
  Plug 'thaerkh/vim-indentguides'

" bracket color 
  " Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'luochen1990/rainbow'

" others
  Plug 'mhinz/vim-startify'
  Plug 'sheerun/vim-polyglot'
  Plug 'cohama/lexima.vim'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
call plug#end()

" color schemes
if (has("termguicolors"))
    set termguicolors     " enable true colors support
endif
syntax enable
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
let g:space_vim_dark_background = 235

" Colorschemes 
" colorscheme catppuccin 
colorscheme space-vim-dark
" colorscheme dracula

" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Configurações do Vim IndentGuides
let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'
" Fim das configurações do Vim IndentGuides

" open new split panes to right and below
set splitright
set splitbelow
let g:lightline = { 'colorscheme': 'catppuccin' }

" bracket color
let g:rainbow_active = 1
" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]

hi Comment    cterm=italic
" hi Normal     ctermbg=NONE guibg=NONE  " background transparency
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" AirLine
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'papercolor'

" Startify
let g:ascii = [
      \'',
      \'',
      \'        /######                                     /##    /##/##                   ',
      \'       /##__  ##                                   | ##   | #|__/                   ',
      \'      | ##  \__/ /######  /######  /####### /######| ##   | ##/##/######/####       ',
      \'      |  ###### /##__  ##|____  ##/##_____//##__  #|  ## / ##| #| ##_  ##_  ##      ',
      \'       \____  #| ##  \ ## /######| ##     | ########\  ## ##/| #| ## \ ## \ ##      ',
      \'       /##  \ #| ##  | ##/##__  #| ##     | ##_____/ \  ###/ | #| ## | ## | ##      ',
      \'      |  ######| #######|  ######|  ######|  #######  \  #/  | #| ## | ## | ##      ',
      \'       \______/| ##____/ \_______/\_______/\_______/   \_/   |__|__/ |__/ |__/      ',
      \'               | ##                                                                 ',
      \'               | ##                                                                 ',
      \'               |__/                                                                 ',
      \'', 
      \ ]

let g:startify_custom_header = startify#center(g:ascii) + startify#center(startify#fortune#boxed())

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv" move split panes to left/bottom/top/right
 nnoremap <A-h> <C-W>H
 nnoremap <A-j> <C-W>J
 nnoremap <A-k> <C-W>K
 nnoremap <A-l> <C-W>L" move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Keybinds
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :qa<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <A-Down> :m +1<CR>
nnoremap <silent> <A-Up> :m -2<CR>
nnoremap <C-a> <esc>ggVG<CR>
vnoremap <C-c> "+y<CR>
" inoremap <C-v> <esc>p<CR>

" Configurações do CoC.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Fim das configurações do CoC.nvim

" Compile & Run
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocm FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
