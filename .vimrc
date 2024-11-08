" vim-plug
call plug#begin()

" Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'

call plug#end()

syntax on
filetype plugin indent on

" colors
set t_Co=256
colorscheme desert256v2

set autoindent
set backspace=2
set belloff=all
set encoding=utf-8
set expandtab
set fillchars+=vert:\ " whitespace before
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nocompatible
set nocursorcolumn
set noswapfile
set novisualbell
set nowritebackup
" set relativenumber
set ruler
set scrolloff=10
set shiftround
set shiftwidth=2
set showcmd
set showmode
set smartcase
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set title
set ttyfast
set updatetime=100
set wildmenu
set wildmode=list:longest

" don't let git gutter map keys
let g:gitgutter_map_keys = 0

"set cursorline
highlight cursorline term=NONE cterm=NONE ctermbg=235

" trying to improve syntax highlighting
syntax sync minlines=100
syntax sync maxlines=300
set synmaxcol=900

" leader to space
let mapleader = "\<Space>"

" jj to exit insert mode
inoremap jj <Esc>

" reload vimrc
nnoremap <leader>vv :source ~/.vimrc<cr>

" easy colon mode
nnoremap ; :

" spacing + numbers
nnoremap <leader>nn :set relativenumber!<cr>
nnoremap <leader>ww :set list!<cr>

" splits
nnoremap <leader>h <c-w><c-h>
nnoremap <leader>j <c-w><c-j>
nnoremap <leader>k <c-w><c-k>
nnoremap <leader>l <c-w><c-l>
nnoremap <leader>wh <c-w><s-h>
nnoremap <leader>wj <c-w><s-j>
nnoremap <leader>wk <c-w><s-k>
nnoremap <leader>wl <c-w><s-l>
nnoremap <leader>sp :tab sp<cr>

" split resize shortcuts
nnoremap <leader>v= :vertical resize +5<cr>
nnoremap <leader>v- :vertical resize -5<cr>
nnoremap <leader>s= :resize +5<cr>
nnoremap <leader>s- :resize -5<cr>

" golang
" autocmd FileType go nnoremap <leader>gb :GoBuild<cr>
" autocmd FileType go nnoremap <leader>gr :GoRun %<cr>
" autocmd FileType go nnoremap <leader>gf :GoFmt<cr>
" autocmd FileType go nnoremap <leader>gl :GoLint<cr>
" autocmd FileType go nnoremap <leader>gd :GoDef<cr>
" autocmd FileType go nnoremap <leader>gh :GoDoc<cr>
" autocmd FileType go nnoremap <leader>gi :GoInfo<cr>

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" disable markdown folds
let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['html', 'js=javascript', 'php', 'css', 'ruby']

" type-specific settings
autocmd FileType sh setlocal noexpandtab
autocmd FileType ts setlocal noexpandtab

" trim trailing whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

" phtml handling
au BufNewFile,BufRead *.phtml set ft=php

" get bash set up
let $BASH_ENV="~/.bash_aliases"

" per file formatting
autocmd FileType go setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType phtml setlocal syntax=php tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType less setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2

" remove the tilde
" hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
