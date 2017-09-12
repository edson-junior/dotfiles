" General configs ----------------------------------------
so ~/.vim/plugins.vim                     " run plugins

syntax enable

colorscheme atom-dark-256

set backspace=indent,eol,start            " make backspace work normally
set number                                " show line numbers
set ruler
set visualbell                            " remove annoying vim bell/beeping
set mouse=a                               " enable scrolling

" File Encoding ----------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Tabs related settings ----------------------------------------
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set autoindent
set smartindent
set smarttab
set undolevels=1000
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

" Visual Settings ----------------------------------------
set mousemodel=popup
set t_Co=256
set guioptions=egmrti

" Search ----------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" Mappings ----------------------------------------
" !!! the leader key is always comma => ','
let mapleader=','

" quickly open my vimrc
nmap <Leader>ev :tabedit ~/work/dotfiles/.vimrc <cr>

" quickly remove highliting after searching
nmap <Leader><space> :nohlsearch<cr>

" toggle nerdtree on Control + n
nmap <C-n> :NERDTreeToggle <cr>

" Commands ----------------------------------------
" always source vimrc on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


" Plugins ---------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" show hidden files in nerdtree
let NERDTreeShowHidden=1

" CtrlP configs
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
