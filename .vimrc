:command W w
:command Q q
:command WQ wq
:command Wq wq
:command Wqa wqa

set nocompatible
filetype plugin on

set mouse=a

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
"
"  allow backspacing over everything in insert mode
"
set backspace=2
set history=50
set ruler
"
"  Content of the ruler string
"
set rulerformat=%l,%c%V%=#%n\ %3p%%
"
"  Show (partial) command in status line
"
set showcmd
"
"  When a bracket is inserted, briefly jump to the matching one
"
set showmatch
"
"  Use swap file
"
set swapfile
"
"  After typing this many chars the swap file will be written to disk
"
set updatecount=50
"
"  Configure .viminfo
"
set viminfo='20,\"50
"
"  Character to start wildcard expansion in the command-line
"
set wildchar=<TAB>
"
"  Put command-line completion in an enhanced mode
"
set wildmenu
"
"  Execute shell commands easier
"
nmap !  :!
"
"  Make selection lowercase
"
vmap ,l  u
"
"  Make selection switch case
"
vmap ,s  ~
"
"  Make selection uppercase
"
vmap ,u  U
" change Vim's working directory to directory containing opened file
autocmd BufWinEnter * if isdirectory(expand('%:p:h')) | lcd %:p:h | endif

map <c-t>h :tabp<cr>
map <c-t>j :tabr<cr>
map <c-t>k :tabl<cr>
map <c-t>l :tabn<cr>
map <c-t>n :tabnew 

syntax on
set paste

" Clear trailing white spaces py files
autocmd BufWritePre *.py :%s/\s\+$//e
au BufNewFile,BufRead *.less set filetype=css

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'davidhalter/jedi'
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'
Bundle 'tpope/vim-fugitive'

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

colorscheme torte

let g:pymode_folding = 0
