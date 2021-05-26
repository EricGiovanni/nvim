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
set ts=2 sw=2
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

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

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

" Different Indents
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab " au FileType java setl ts=4 sw=4 et

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

" Use <c-space> to trigger completion
if &filetype == "javascript" || &filetype == "python" || &filetype == "html" || &filetype == "css"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-t>"
