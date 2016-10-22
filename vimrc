" vim:fdm=marker

" Make vim more useful {{{
set nocompatible
" }}}


" Syntax highlighting {{{
set background=dark
colorscheme molokai
set t_Co=256
" }}}

" Mapleader {{{
let mapleader=","
" }}}

" Local directories {{{
set noswapfile           " Turn off swap files
set nobackup
set nowritebackup
set backupdir=~/.vim/backups
set undodir=~/.vim/undo
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" }}}

" General settings {{{
set backspace=indent,eol,start
set autoindent            " Copy indent from last line when starting new line
set cursorline            " Highlight current line
set diffopt=filler        " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite       " Ignore whitespace changes (focus on code changes)
set diffopt+=vertical     " Always use vertical diffs
set esckeys               " Allow cursor keys in insert mode
set ruler
set number                " Line numbers are good
set relativenumber        " Show relative line numbers
set hidden                " When a buffer is brought to foreground, remember undo history and marks
set history=1000
set laststatus=2          " always show status line
set nowrap                " Do not wrap lines
set lazyredraw            " Don't redraw when we don't have to
set showcmd               " Show incomplete cmds down the bottom
set noshowmode            " Don't show current mode (airline.vim takes care of us)
set nostartofline         " Don't reset cursor to start of line when moving around
set showmatch             " Show matching brackets
set gcr=a:blinkon0        " Disable cursor blink
set visualbell            " No sounds
set autoread              " Reload files changed outside vim
set autowrite
set ttyfast               " Optimize for fast terminal connections
set noeol
set linebreak             " Wrap lines at convenient points
set scrolloff=1           " start scrolling when we're 1 line away from margins
set sidescrolloff=5
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set binary
set display+=lastline
set cmdheight=2
set shortmess=atI         " Don't show the intro message when starting vim
set title                 " Show the filename in the window titlebar
set magic                 " Enable extended regexes
set mouse=a               " Enable mouse in all in all modes
set ttymouse=xterm        " Set mouse type to xterm
set undofile              " Persistent undo
set splitbelow            " New window goes below
set splitright            " New windows goes right
"set viminfo=%,'9999,s512  " ,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set wrapscan              " Searches wrap around end of file
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set textwidth=80
" set colorcolumn=+1
let &colorcolumn="80,".join(range(100,9999),",")
" hi ColorColumn guibg=darkgrey ctermbg=246
" }}}

" Folding options {{{
set foldcolumn=0      " Column to show folds
set foldlevel=99      " no folds closed by default, 0 to close all folds
set foldmethod=indent " Syntax are used to specify folds
set foldminlines=0    " Allow folding single lines
set foldnestmax=5     " Max fold nesting level
set nofoldenable      " dont fold by default
" }}}


" Format options {{{
set formatoptions=
set formatoptions+=c  " Format comments
set formatoptions+=r  " Continue comments by default
set formatoptions+=o  " Make comment when using o or O from comment line
set formatoptions+=q  " Format comments with gq
set formatoptions+=n  " Recognize numbered lists
set formatoptions+=2  " Use indent from 2nd line of a paragraph
set formatoptions+=l  " Don't break lines that are already long
set formatoptions+=1  " Break before 1-letter words
" }}}

" Search options {{{
set gdefault      " By default add /g flag to search/replace. Add g to toggle
set hlsearch      " Highlight searches
set incsearch     " Highlight dynamically as pattern is typed
set ignorecase    " Ignore case of searches
set smartcase     " ...unless we type a capital
                  " }}}


" Tab options {{{
set smarttab      " at start of line, <Tab> insert shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set shiftwidth=2  " The # of spaces of indenting
set tabstop=2
set expandtab     " Expand tabs to spaces
" }}}

" Wild menu {{{
set wildchar=<TAB>             " Character for CLI expansion (TAB-completion)
set wildmode=longest:list:full " Complete only until point of ambiguity
set wildmenu                   " Hitting TAB in command mode will show possible completions above command line
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
" }}}

" Loading Plugins ------------------------------------------------------------
" {{{
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
" }}}

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin on
filetype plugin indent on

set modeline              " Read file modeline for formatting

" Configuration ---------------------------------------------------------------

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Fast Escape {{{
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=100
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}


" General {{{
augroup general_config
  autocmd!


  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Normal write (;w) and sudo write (,W) {{{
  noremap ;w :w<CR>
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Get output of shell commands {{{
  command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
  " }}}

  " Better mark jumping (line + col) {{{
  nnoremap ' `
  " }}}

  " Hard to type things {{{
  iabbrev >> →
  iabbrev << ←
  iabbrev ^^ ↑
  iabbrev VV ↓
  iabbrev aa λ
  " }}}

  " Toggle show tabs and trailing spaces (,c) {{{
  set list
  " set listchars=tab:»·,trail:·,eol:¬,nbsp:·
  set listchars=tab:⇥·,trail:·,eol:¬,nbsp:·
  set fcs=fold:-
  nnoremap <silent> <leader>c :set nolist!<CR>
  " }}}

  " Paste toggle (,p) {{{
  set pastetoggle=<leader>p
  map <leader>p :set invpaste paste?<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

augroup END
" }}}

" Jump to last know cursor position {{{
augroup last_cursor
  autocmd!

  " When editing a file, always jump to the last known cursor positioy.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

augroup END
" }}}


" File type options {{{
augroup ft_options
  autocmd!

  filetype on

  autocmd BufRead,BufNewFile Appraisals   set filetype=ruby
  autocmd BufRead,BufNewFile *.md         set filetype=markdown
  autocmd BufRead,BufNewFile *.es6        set filetype=javascript
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint,babel,bower}rc set filetype=javascript
  autocmd FileType sh,zsh,csh,tcsh        inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
  autocmd FileType sh,zsh,csh,tcsh        let &l:path = substitute($PATH, ':', ',', 'g')
  autocmd FileType apache                 setlocal commentstring=#\ %s
  autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
  autocmd FileType c,cpp,cs,java          setlocal commentstring=//\ %s
  autocmd Syntax   javascript             setlocal isk+=$

  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
augroup END
" }}}


" GUI options {{{
if has("gui_running")
  if has("mac")
    " Use 14pt Inconsolata
    set guifont=Inconsolata\ for\ Powerline:h16
  elseif has("unix")
    if &guifont == ""
      set guifont=Inconsolata\ 14
    endif
  elseif has("win32")
    set guifont=Inconsolata\ for\ Powerline:h14,Consolas:h12,Courier\ New:h12
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
  endif

  " Don’t blink cursor in normal mode
  set guicursor=n:blinkon0
  " Better line-height
  set linespace=4
endif
" }}}


source ~/.vim/settings.vim

" Loading local vimrc {{{
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }}}