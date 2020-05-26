" General configs ----------------------------------------

" File Encoding ----------------------------------------
set encoding=utf-8 nobomb
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

so ~/.vim/plugins.vim                     " run plugins

set t_Co=256
syntax on

set backspace=indent,eol,start            " make backspace work normally
set number                                " show line numbers
set ruler
set visualbell                            " remove annoying vim bell/beeping
set mouse=a                               " enable scrolling
set diffopt=filler                        " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite                       " Ignore whitespace changes (focus on code changes)
set clipboard=unnamed                     " Allow vim to copy stuff to clipboard
set noshowmode                            " Don't show the current mode (airline.vim takes care of us)
set viminfo=%,'9999,s512,n~/.vim/viminfo  " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set undofile                              " Persistent Undo
set colorcolumn=80                        " Set column marker

" set color of column bar
hi ColorColumn ctermbg=235


" Local directories ----------------------------------------
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


" Ignore files/folders ----------------------------------------
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/webroot/WEB-INF/lib/*,*/webroot/_ui/*,*npm-debug.log*,*/project/.buildflag*,*/project/grunt-tmp/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*


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
set expandtab " Expand tabs to spaces
set esckeys " Allow cursor keys in insert mode


" visual settings ----------------------------------------
set mousemodel=popup
set guioptions=egmrti


" search ----------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase


" spell checking  ----------------------------------------
set spell spelllang=en_us,es_es,nl,pt_br,it
set spell

" better highlighting of spell checker
" hi SpellBad ctermfg=168 ctermbg=none cterm=underline


" mappings ----------------------------------------
" the leader key is always comma => ','
let mapleader=','

" quickly open my vimrc
nmap <leader>ev :e ~/work/dotfiles/.vimrc <cr>

" quickly open plugin list
nmap <leader>ep :e ~/work/dotfiles/.vim/plugins.vim <cr>

" quickly remove highliting after searching
nmap <leader><space> :nohlsearch<cr>

" toggle nerdtree on control + n
nmap <C-n> :NERDTreeToggle <cr>
nmap <leader>m :NERDTreeFind<CR>

" better split switching (ctrl-j, ctrl-k, ctrl-h, ctrl-l)
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" fix page up and down
map <pageup> <C-u>
map <pagedown> <C-d>
imap <pageup> <C-o><C-u>
imap <pagedown> <C-o><C-d>

" fast saves
nmap <leader>w :w!<cr>

" buffers  ----------------------------------------
augroup buffer_control
  autocmd!
  " Prompt for buffer to select (,bs)
  nnoremap <leader>bs :CtrlPBuffer<CR>

  " Buffer navigation (,,) (gb) (gB) (,ls)
  map <Leader>, <C-^>
  map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>

  " Jump to buffer number (<N>gb)
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile

  " Close buffer
  map <Leader>qq :bd<CR>

  " Toggle split pane
  map <Leader>rr :vertical resize 800<CR>

augroup END


" Plugins configurations ---------------------------------------
" airline.vim
augroup airline_config
  autocmd!
  let g:airline_theme='base16_snazzy'
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END

" CtrlP.vim
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
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
augroup END


" show hidden files in nerdtree
let NERDTreeShowHidden=1

" vim-jsx configuration
let g:jsx_ext_required = 0


" NERD Commenter
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
