" Basic
set nocompatible
syntax on
filetype off
set ruler
set number
set showcmd
set modeline
set background=dark

" My Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" vim-scripts
Bundle 'vim-flake8'

filetype plugin indent on
" Python
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99

"vim flake8
let g:pyflakdes_use_quickfix=0
let g:flake8_ignore='E501'
autocmd BufWritePost *.py call Flake8()
