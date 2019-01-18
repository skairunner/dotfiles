" Plugins
if exists('*minpac#init')
  call minpac#init()
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('w0rp/ale')
  call minpac#add('machakann/vim-sandwich')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('junegunn/vim-peekaboo')
  call minpac#add('srcery-colors/srcery-vim')
  call minpac#add('vim-python/python-syntax')
  call minpac#add('Konfekt/FastFold')
  call minpac#add('tmhedberg/SimpylFold')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('neoclide/coc.nvim')
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

" Folding
set foldlevel=99
set foldmethod=syntax

" Indent settings
augroup indent
  autocmd!
  autocmd FileType python setlocal ts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sw=2 expandtab
  autocmd FileType htmldjango doau FileType html
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab
  autocmd FileType eruby setlocal ts=2 sw=2 expandtab
  autocmd FileType json setlocal ts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sw=2 expandtab
  autocmd FileType scss doau FileType css
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

" Python 3 coloration
let g:python_highlight_all = 1

let g:ale_linters = {'rust': ['rls']}
let g:ale_python_flake8_auto_pipenv = 1
" ALE Rust
let g:ale_rust_rls_toolchain = "stable"

" coc.nvim use tab to complete
inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
