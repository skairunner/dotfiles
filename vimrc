if exists('*minpac#init')
  call minpac#init()
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('w0rp/ale')
  call minpac#add('machakann/vim-sandwich')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" Set scheme
color koehler

" Displaying whitespace
set list listchars=tab:│\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Lines
set number relativenumber

augroup vimrc
  autocmd!

  " Leading spaces display
  highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
  autocmd BufWinEnter,BufReadPre * syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
  autocmd BufWinEnter,BufReadPre * setlocal conceallevel=2 concealcursor=nv

  " Set tab-space per filetype
  autocmd FileType python setlocal ts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=4 sw=4 noexpandtab
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab
augroup END
