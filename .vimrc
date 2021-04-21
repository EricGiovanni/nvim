" Configuraciones iniciales
set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set path+=**
set wildmenu

" Plugins
call plug#begin('~/.vim/plugged')

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

call plug#end()

let NERDTreeQuitOnOpen=1
let mapleader=" "

" Lightlane
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'relativepath', 'modified' ]],
      \   'right': [ [ 'kitestatus' ], [ 'filetype', 'filename', 'modified', 'percent', 'lineinfo' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \	  'kitestatus': 'kite#statusline'
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ },
      \ }

" Kite
let g:kite_supported_languages = [ 'javascript', 'python', 'html', 'css' ]

" coc
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@

" EasyMotion
nmap <Leader>s <Plug>(easymotion-s2)

" NERDTree
nmap <Leader>nt :NERDTreeFind<CR>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Git
nmap <Leader>gl :Git pull<CR>
nmap <Leader>gs :Git push<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>ga :Git add .<CR>

" Atajos Personalizados
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
imap jj <Esc>

" Use <c-space> to trigger completion
if &filetype == "javascript" || &filetype == "python" || &filetype == "html" || &filetype == "css"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif
