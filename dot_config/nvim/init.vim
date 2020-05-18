scriptencoding utf-8

" Plugins
if exists('*minpac#init')
  call minpac#init()
  call minpac#add('Konfekt/FastFold')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('junegunn/vim-peekaboo')
  call minpac#add('justinmk/vim-sneak')
  call minpac#add('machakann/vim-sandwich')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('srcery-colors/srcery-vim')
  call minpac#add('tmhedberg/SimpylFold')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('vim-python/python-syntax')
  call minpac#add('w0rp/ale')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" Default colorscheme
colorscheme srcery
set termguicolors

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

" Python 3 coloration
let g:python_highlight_all = 1

" ALE
let g:ale_linters = {'rust': ['rls']}

" ALE Python
let g:ale_python_flake8_auto_pipenv = 1

" ALE Rust
let g:ale_rust_rls_toolchain = 'stable'
