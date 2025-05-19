" vim-plug
call plug#begin()

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'name': 'dracula' }

call plug#end()

" :CocInstall <plugin>
" coc-html
" coc-tsserver
" coc-json
" coc-css

syntax on
filetype plugin indent on

" airline
let g:airline_theme='dracula'

" colors
" set t_Co=256
colorscheme dracula

set autoindent
set backspace=2
set belloff=all
set cursorline
set encoding=utf-8
set expandtab
set fillchars+=vert:\ " whitespace before
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
" set mouse=a
set number
set nobackup
set nocompatible
set nocursorcolumn
set noswapfile
set novisualbell
set nowritebackup
set relativenumber
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

" toggle line numbers
nnoremap <leader>nn :set nonumber! \| set relativenumber!<cr>

" paste toggle
nnoremap <leader>pp :set paste!<cr>

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

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" trim trailing whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

" phtml handling
autocmd BufNewFile,BufRead *.phtml set ft=php

" git gutter
let g:gitgutter_map_keys = 0

nmap <leader>gg :GitGutterToggle<cr>

" coc mappings
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>

nmap <leader>rn <Plug>(coc-rename)

" open defs in splits
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent><nowait> gs :call CocAction('jumpDefinition', 'split')<CR>

" diagnostics
nnoremap <silent><nowait> [[ <Plug>(coc-diagnostic-prev)
nnoremap <silent><nowait> ]] <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> `` :CocDiagnostics<CR>

" c-j either moves down the list, or trigger the list
inoremap <silent><expr> <c-j> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
" c-k moves up the list, or also triggers the list
inoremap <silent><expr> <c-k> coc#pum#visible() ? coc#pum#prev(1) : coc#refresh()
" accept the selected completion
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
endif

" coc-prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" prettier format
nnoremap <silent><leader>ff :Prettier<cr>

" format on save
autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.html,*.css,*.scss,*.md,*.yaml Prettier
