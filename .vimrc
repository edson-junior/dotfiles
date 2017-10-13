" General configs ----------------------------------------
so ~/.vim/plugins.vim                     " run plugins

syntax enable

colorscheme atom-dark-256

set backspace=indent,eol,start            " make backspace work normally
set number                                " show line numbers
set ruler
set visualbell                            " remove annoying vim bell/beeping
set mouse=a                               " enable scrolling
set omnifunc=syntaxcomplete#Complete      " enable omni completion 
set shortmess=atI                         " Don't show the intro message when starting vim
set diffopt=filler                        " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite                       " Ignore whitespace changes (focus on code changes)
set clipboard=unnamed                     " Allow vim to copy stuff to clipboard
set noshowmode " Don't show the current mode (airline.vim takes care of us)

" Local directories ----------------------------------------
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


" Ignore files/folders ----------------------------------------
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*


" File Encoding ----------------------------------------
set encoding=utf-8 nobomb
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
set expandtab " Expand tabs to spaces
set esckeys " Allow cursor keys in insert mode


" Folding ----------------------------------------
set foldenable " Enable folding
set foldcolumn=0 " Column to show folds
set foldlevel=99 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " allow folding single lines
set foldnestmax=5 " set max fold nesting level


" visual settings ----------------------------------------
set mousemodel=popup
set t_co=256
set guioptions=egmrti


" search ----------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase


" mappings ----------------------------------------
" !!! the leader key is always comma => ','
let mapleader=','

" quickly open my vimrc
nmap <leader>ev :tabedit ~/work/dotfiles/.vimrc <cr>

" quickly open plugin list
nmap <leader>ep :tabedit ~/work/dotfiles/.vim/plugins.vim <cr>

" quickly remove highliting after searching
nmap <leader><space> :nohlsearch<cr>

" toggle nerdtree on control + n
nmap <C-n> :NERDTreeToggle <cr>

" trigger emmet on ctrl+e, using <tab> ain't a great idea after all
let g:user_emmet_expandabbr_key = '<C-e>'

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


" commands ----------------------------------------
" always source vimrc on save
augroup autosourcing
  autocmd!
  autocmd bufwritepost .vimrc source %
augroup end

" always source plugins.vim on save
augroup autosourcing
  autocmd!
  autocmd bufwritepost ~/work/dotfiles/.vim/plugins.vim source %
augroup end


" File Types ----------------------------------------
" JavaScript
augroup filetype_javascript
  autocmd!
  let g:javascript_conceal = 1
augroup END

" JSON
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END

" XML
augroup filetype_xml
  autocmd!
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END

" Markdown
augroup filetype_markdown
  autocmd!
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END

" ZSH
augroup filetype_zsh
  autocmd!
  au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
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
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\'
augroup END

" syntastic.vim
augroup syntastic_config
  autocmd!
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
augroup END

" airline.vim
augroup airline_config
  autocmd!
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
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

" NERD Commenter
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
