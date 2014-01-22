:command WQ wq
:command Wq wq
:command W w
:command Q q

set nocompatible
filetype plugin on

set mouse=a

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

map <c-t>h :tabp<cr>
map <c-t>j :tabr<cr>
map <c-t>k :tabl<cr>
map <c-t>l :tabn<cr>
map <c-t>n :tabnew 

syntax on
set paste
set list

" Clear trailing white spaces py files
autocmd BufWritePre *.py :%s/\s\+$//e
au BufNewFile,BufRead *.less set filetype=css

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'davidhalter/jedi'
Bundle 'davidhalter/jedi-vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'godlygeek/csapprox'
Bundle 'ashleyblackmore/terminator-solarized'

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

