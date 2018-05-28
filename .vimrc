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
set background=dark
syntax on
colorscheme Tomorrow-Night

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
set noshowmode                            " Don't show the current mode (airline.vim takes care of us)
set viminfo=%,'9999,s512,n~/.vim/viminfo  " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set undofile                              " Persistent Undo
set colorcolumn=80                        " Set column marker


" Local directories ----------------------------------------
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


" Ignore files/folders ----------------------------------------
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
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
nmap <leader>ev :e ~/work/dotfiles/.vimrc <cr>

" quickly open plugin list
nmap <leader>ep :e ~/work/dotfiles/.vim/plugins.vim <cr>

" quickly remove highliting after searching
nmap <leader><space> :nohlsearch<cr>

" toggle nerdtree on control + n
nmap <C-n> :NERDTreeToggle <cr>
nmap <leader>m :NERDTreeFind<CR>

" trigger emmet on ctrl+e, using <tab> ain't a great idea after all
let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key = '<C-e>'
autocmd FileType html,css,javascript,jsx,php EmmetInstall

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

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

augroup END


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
" Jade
augroup filetype_jade
  autocmd!
  au BufRead,BufNewFile *.pug set ft=jade syntax=jade
augroup END

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
" airline.vim
augroup airline_config
  autocmd!
  let g:airline_theme='tomorrow'
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
augroup END

" Silver Searcher
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

" vim-jsx configuration
let g:jsx_ext_required = 0

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" enable neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
augroup omnicomplete
  autocmd!
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-mocha/snippets'

" neocomplete snippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" NERD Commenter
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
