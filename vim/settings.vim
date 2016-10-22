" vim:fdm=marker

let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor

" EasyAlign.vim {{{
augroup easy_align_config
  autocmd!
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  " start interactive EasyAlign for a motion/text object (e.g. ,aip)
  nmap <Leader>a <Plug>(EasyAlign)
augroup END
" }}}

" Notes.vim {{{
augroup notes_config
  autocmd!
  let g:notes_directories = ['~/Dropbox/Notes']
augroup END
" }}}

" closetag.vim {{{
augroup closetag_config
  autocmd!
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.pom"
augroup END
" }}}

" emmet.vim {{{
augroup emmet_config
  autocmd!
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
augroup END
" }}}

" react jsx config {{{
augroup jsx_config
  autocmd!

  let g:jsx_ext_required = 0
augroup END
" }}}

" Syntastic config {{{
augroup syntastic_config
  autocmd!

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_loc_list_height = 5
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_javascript_checkers = ['eslint']
  " let g:syntastic_javascript_eslint_exec = 'eslint_d'

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_warning_symbol = '💩'

  highlight link SyntasticErrorSign SignColumn
  highlight link SyntasticWarningSign SignColumn
  highlight link SyntasticStyleErrorSign SignColumn
  highlight link SyntasticStyleWarningSign SignColumn

  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  " " let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
  nnoremap <Leader>sc :SyntasticCheck<CR> :SyntasticToggleMode<CR>


  let g:syntastic_html_tidy_exec = 'tidy'
  " let g:syntastic_javascript_checkers = ['jshint', 'eslint']
  let g:syntastic_java_checkers = []


  nnoremap <Leader>lo :lopen<CR>
  nnoremap <Leader>lc :lclose<CR>
  nnoremap <Leader>lp :lprevious<CR>
  nnoremap <Leader>ln :lNext<CR>

augroup END
" }}}

" IndentLine config {{{
augroup indentline_config
  autocmd!
  let g:indentLine_char = '┆'
  " let g:indentLine_char = ''
  nmap <silent> <Leader>il :IndentLinesToggle<CR>
augroup END
" }}}

augroup autoformat
  autocmd!
  let g:formatterpath = ['/Users/zhenyu/.nvm/versions/node/v5.11.1/bin']
  let g:autoformat_verbosemode=1
augroup END