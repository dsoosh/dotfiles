:command W w
:command Q q
:command WQ wq
:command Wq wq
:command Wqa wqa

language en_US.utf-8

set nocompatible
filetype plugin on

set mouse=a

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

let mapleader = ","
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
Bundle 'FuzzyFinder'
Bundle 'L9'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
"Bundle 'davidhalter/jedi'
"Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'klen/python-mode'
"Bundle 'Lokaltog/powerline'
"Bundle 'yodiaditya/vim-pydjango'

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

colorscheme torte

let g:pymode_folding = 0
let g:pymode_rope = 1
let g:pymode_rope_vim_completion = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

autocmd BufRead *.html -c "set sw=2 | %s/>/>\r/ | execute 'normal gg=G' | set nohlsearch | g/^\\s*\$/d"
