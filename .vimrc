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


" Plugins configurations ---------------------------------------
" CtrlP configs
augroup ctrlp_config
  autocmd!
  let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
  let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
  let g:ctrlp_match_window_bottom = 0 " Show at top of window
  let g:ctrlp_max_files = 0 " Set no file limit, we are building a big project
  let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
  let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
augroup END

" silver searcher config
augroup ag_config
  autocmd!

  if executable("ag")
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Have the silver searcher ignore all the same things as wilgignore
    let b:ag_command = 'ag %s -i --nocolor --nogroup'

    for i in split(&wildignore, ",")
      let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
      let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
    endfor

    let b:ag_command = b:ag_command . ' --hidden -g ""'
    let g:ctrlp_user_command = b:ag_command
  endif
augroup END

" show hidden files in nerdtree
let NERDTreeShowHidden=1
