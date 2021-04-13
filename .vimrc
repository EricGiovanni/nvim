set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode

call plug#begin('~/.vim/plugged')

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let NERDTreeQuitOnOpen=1
let mapleader=" "

" Lightlane
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [], ['relativepath', 'modified']],
      \   'right': [ [ 'kitestatus' ], [ 'filetype', 'filename', 'modified', 'percent', 'lineinfo' ], [ 'gitbranch' ] ]
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
let g:kite_supported_languages = [ 'javascript', 'python', 'java', 'html', 'css', 'go' ]

" coc
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@

" EasyMotion
nmap <Leader>s <Plug>(easymotion-s2)

" NERDTree
nmap <Leader>nt :NERDTreeFind<CR>

" Atajos Personalizados
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
