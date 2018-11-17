" Plugins
if exists('*minpac#init')
  call minpac#init()
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('w0rp/ale')
  call minpac#add('machakann/vim-sandwich')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('junegunn/vim-peekaboo')
  call minpac#add('srcery-colors/srcery-vim')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" Share files with standard Vim.
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  set packpath^=~/.vim packpath+=~/.vim/after
endif

" Enable true color support
if has("termguicolors")
  set termguicolors
endif
" Work around Vim's BCE problems
if !has('nvim') && $TERM =~# '^\%(tmux\|screen\)'
  set term=xterm-256color " Handle screen correctly in regular Vim.
endif

" Default colorscheme
colorscheme srcery

" Displaying whitespace
set list listchars=tab:│\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Lines
set number relativenumber

" Indent settings
augroup indent
  autocmd!
  autocmd FileType python setlocal ts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sw=4 noexpandtab
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab
augroup END

" Sneak with f
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Use the Windows system clipboard
if !empty(matchstr(system("uname -a"), "Microsoft"))
  let g:clipboard = {
    \ 'name': 'win32yank',
    \ 'copy': {
    \   '+': 'win32yank.exe -i --crlf',
    \   '*': 'win32yank.exe -i --crlf',
    \   },
    \ 'paste': {
    \   '+': 'win32yank.exe -o --lf',
    \   '*': 'win32yank.exe -o --lf',
    \   },
    \ 'cache_enabled': 1,
    \ }
endif
