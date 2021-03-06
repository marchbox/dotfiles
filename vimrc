" .vimrc

" Pathogen
execute pathogen#infect()
call pathogen#helptags()


" No compatibility
set nocompatible
set encoding=utf-8

" No recovery files
set noswapfile


" Syntax highlighting

" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable
" 256 colours, please
set t_Co=256
" Dark solarized scheme
set background=dark
let g:solarized_termcolors=256
colorscheme jellybeans



" Set filetype specific settings
au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.njk set filetype=html
au BufRead,BufNewFile *.gnode set filetype=html
au BufRead,BufNewFile *.soy set filetype=soy colorcolumn=101
au BufRead,BufNewFile *.gss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.java set colorcolumn=101
au BufRead,BufNewFile *.tsx set filetype=typescript


" Tabs, indentation and lines

filetype plugin indent on
" 2 spaces please
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" Round indent to nearest multiple of 4
set shiftround
" No line-wrapping
set nowrap



" Interactions

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
" Underscores denote words
set iskeyword-=_
" Use system clipboard as the default buffer
set clipboard=unnamed


" Visual decorations

" Show status line
set laststatus=2
" Show what mode you’re currently in
set showmode
" Show what commands you’re typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Set relative line numbers if we can...
if exists("+relativenumber")
    " Due to a problem with relative line numbers not persisting across new
    " tabs and splits, set no line numbers at all...
    set nonumber
    " ..then set relative ones.
    set relativenumber
    set number
" ...otherwise let’s just have regular ones.
else
    set number
endif
" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
    set colorcolumn=81
endif
" Highlight current line
set cursorline
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase
" Auto complete for command menu
set wildmenu
" Disable code folding
set nofoldenable

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" Key mappings

" Use , instead \ for leader
let mapleader=","
" Always move between visual lines.
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$
noremap gj j
noremap gk k
noremap g^ ^
noremap g$ $
" jj to throw you into normal mode from insert mode
inoremap jj <esc>
" jk to throw you into normal mode from insert mode
inoremap jk <esc>
" kk to throw you into normal mode from insert mode
inoremap kk <esc>
" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
" Make ; do the same as :
nnoremap ; :
" Black hole register
map <leader>b "_
" Resize window
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" Double ; to save
nnoremap ;; :w<CR>
" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
" Edit .vimrc file
nmap <leader>v :tabedit $MYVIMRC<CR> 
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
" ,o to open files in new tabs
nnoremap <leader>o :tabe 
" Shift + K for line splitting
nnoremap K i<CR><Esc>

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>


" Plugins

" matchit
runtime macros/matchit.vim

" Tmuxline
let g:tmuxline_powerline_separators = 0

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" vim markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

" Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction
function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" For typescript highlighting with vim-polyglot
" See: https://github.com/HerringtonDarkholme/yats.vim#config
set re=0

" vim-signify
" default updatetime 4000ms is not good for async update
set updatetime=100

" lightline + vim-line-no-indicator
let g:lightline = {
    \ 'component': {
    \   'indicator': '%{LineNoIndicator()}'
    \ },
    \ 'active': {
    \   'left': [
    \     [ 'mode', 'paste' ],
    \     [ 'readonly', 'relativepath', 'modified' ]
    \   ],
    \   'right': [
    \     [ 'lineinfo' ],
    \     [ 'indicator' ],
    \     [ 'fileformat', 'fileencoding', 'filetype' ]
    \   ]
    \ },
    \ 'inactive': {
    \   'left': [
    \     [ 'filename' ]
    \   ],
    \   'right': [
    \     [ 'indicator' ],
    \     [ 'lineinfo' ]
    \   ]
    \ }
    \ }
