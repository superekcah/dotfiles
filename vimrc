" Basic
set nocompatible
syntax on
filetype off
set ruler
set number
set showcmd
set modeline
set background=dark
set encoding=utf-8
set laststatus=2
set history=200
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set colorcolumn=80
"set hlsearch
set incsearch

" My Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"
" Github
Bundle 'scrooloose/nerdtree'
" vim-scripts
Bundle 'vim-flake8'
Bundle 'pythoncomplete'
Bundle 'Pydiction'
Bundle 'Command-T'
Bundle 'taglist-plus'
Bundle 'minibufexplorerpp'
Bundle 'The-NERD-Commenter'

filetype plugin indent on
" Python
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
" Generate tags
noremap <leader>ptags :! find -X . -name \*.py -print \| xargs ptags.py

" Auto-completion
set completeopt=longest,menu
set wildmenu
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location='~/.vim/bundle/Pydiction'

" vim flake8
let g:pyflakdes_use_quickfix=0
let g:flake8_ignore='E501'
"autocmd BufWritePost *.py call Flake8()

" taglist-plus
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1
let Tlist_Show_Menu=1
nmap <silent> <F9> :TlistToggle<cr>

" NERDTree
let g:NERDTree_title='[NERD Tree]'
nmap <silent> <F8> :NERDTreeToggle<cr>

" MiniBufExplorer
"let g:miniBufExplSplitBelow=0
"let g:miniBufExplMinSize=1
"let g:miniBufExplMaxSize=3
"let g:miniBufExplorerMoreThanOne=1
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:minBufExplModSelTarget=1

