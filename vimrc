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
set hlsearch
set incsearch

if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" My Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"
" Github
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mbadran/headlights'
" vim-scripts
Bundle 'c.vim'
Bundle 'vim-flake8'
Bundle 'ctrlp.vim'
Bundle 'pythoncomplete'
Bundle 'Pydiction'
Bundle 'taglist-plus'
Bundle 'minibufexplorerpp'
Bundle 'The-NERD-Commenter'
Bundle 'fugitive.vim'

"set color scheme
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized

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
"let g:flake8_ignore='E501'
autocmd BufWritePost *.py call Flake8()

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

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" cscope
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" MiniBufExplorer
"let g:miniBufExplSplitBelow=0
"let g:miniBufExplMinSize=1
"let g:miniBufExplMaxSize=3
"let g:miniBufExplorerMoreThanOne=1
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:minBufExplModSelTarget=1

" diff saved
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Other custom key-bindings
cmap w!! w !sudo tee % >/dev/null
