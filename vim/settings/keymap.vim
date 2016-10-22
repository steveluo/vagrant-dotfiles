" ===============================
" Window navigation
" ===============================
" need vim-tmux-navigator
"
" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, K, J
" NOTE: This has moved to vim/settings/vim-tmux-navigator.vim.
" nnoremap <silent> <C-h> <C-w>h
" nnoremap <silent> <C-l> <C-w>l
" nnoremap <silent> <C-k> <C-w>k
" nnoremap <silent> <C-j> <C-w>j

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> <Leader>wv <C-w>v
nnoremap <silent> <Leader>ws <C-w>s

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <Leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <Leader>cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>
" Type ,hl to toggle highlighting on/off, and show current value.
noremap <Leader>hl :set hlsearch! hlsearch?<CR>

" Keys remap for line start and end
nnoremap 0 ^
nnoremap ^ 0
nnoremap H 00
nnoremap L $
imap jk <Esc>


" Buffers {{{
" airline tab
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

nnoremap <F8> :bn<CR>
nnoremap <S-F8> :bp<cr>
map <Leader>bl :buffers<CR>
map <Leader>x :bp<CR>
map <Leader>z :bn<CR>


" BufOnly
map <silent> <Leader>bf :BufOnly<CR>
" }}}

" ===============================
" Surrounding
" ===============================

" surround a word with "quotes"
map <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>

" surround a word with 'single quotes'
map <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <Leader>( ysiw(
map <Leader>) ysiw)
vmap <Leader>( c( <C-R>" )<ESC>
vmap <Leader>) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map <Leader>] ysiw]
map <Leader>[ ysiw[
vmap <Leader>[ c[ <C-R>" ]<ESC>
vmap <Leader>] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map <Leader>} ysiw}
map <Leader>{ ysiw{
vmap <Leader>} c{ <C-R>" }<ESC>
vmap <Leader>{ c{<C-R>"}<ESC>

map <Leader>` ysiw`


" Go to last edit location with ,.
nnoremap <Leader>. '.


" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" ============================
" quickfix
" ============================
" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> <Leader><Leader>c :cclose<CR>
nmap <silent> <Leader><Leader>o :copen<CR>

" Map Ctrl-x and Ctrl-z to navigate the quickfix error list (normally :cn and
" :cp)
nnoremap <silent> <C-x> :cn<CR>
nnoremap <silent> <C-z> :cp<CR>


" =============================
" NERDTree
" =============================
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>


" =============================
" tComment
" =============================
" Command-/ to toggle comments
map <Leader>/ :TComment<CR>
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

" EasyAlign {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ===============================================================
" Tabularize
" ===============================================================
" Hit Cmd-Shift-A then type a character you want to align by
" nmap <D-A> :Tabularize /
" vmap <D-A> :Tabularize /
"
" nmap <Leader><Leader>= :EasyAlign=<CR>
" vmap <Leader><Leader>= :EasyAlign=<CR>
"
" nmap <Leader><Leader>: :EasyAlign /:<CR>
" vmap <Leader><Leader>: :Tabularize /:<CR>
"
" Source current file Cmd-% (good for vim development)
map <D-%> :so %<CR>

" ===============================================================
" impaired
" ===============================================================
nmap <C-UP> [e
nmap <C-DOWN> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" ===============================================================
" Ag
" ===============================================================
" Open the Ag command and place the cursor into the quotes
nmap ,ag :Ag ""<Left>
nmap ,af :AgFile ""<Left>
