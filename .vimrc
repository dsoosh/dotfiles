:command W w
:command Q q
:command WQ wq
:command Wq wq
:command Wqa wqa

language en_US.utf-8

set nocompatible
filetype plugin on

set mouse=a

set number

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
filetype indent on
set smartindent

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


syntax on
au BufNewFile,BufRead *.less set filetype=css

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'FuzzyFinder'
Bundle 'L9'

Bundle 'davidhalter/jedi'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'klen/python-mode'
Bundle 'Rykka/riv.vim'
Bundle 'nvie/vim-rst-tables'

Plugin 'chriskempson/base16-vim'

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

autocmd vimenter * wincmd p

colorscheme base16-default
set background=dark

let g:pymode_folding = 0
let g:pymode_rope = 0


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
"
" disable jedi docstring window
autocmd FileType python setlocal completeopt-=preview

function FindDjangoSettings()
  if strlen($VIRTUAL_ENV) && has('python')
    let output  = system("find $VIRTUAL_ENV \\( -wholename '*/lib/*' -or -wholename '*/install/' \\) -or \\( -name 'settings.py' -print0 \\) | tr '\n' ' '")
    let outarray= split(output, '[\/]\+')
    let module  = outarray[-2] . '.' . 'settings'
    let syspath = system("python -c 'import sys; print sys.path' | tr '\n' ' ' ")
    " let curpath = '/' . join(outarray[:-2], '/')

    execute 'python import sys, os'
    " execute 'python sys.path.append("' . curpath . '")'
    " execute 'python sys.path.append("' . syspath . '")'
    execute 'python sys.path = ' . syspath
    execute 'python os.environ.setdefault("DJANGO_SETTINGS_MODULE", "' . module . '")'
  endif
endfunction
autocmd FileType python call FindDjangoSettings()
"  Edit .vimrc
"
nmap ,rc :n $HOME/dotfiles/.vimrc<CR>
"
"  Create new window below or on the right of current one
"
set splitbelow splitright

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

set nofoldenable
set foldlevelstart=99

let rst_project = {'path': '~/docs/'}
let g:riv_projects = [rst_project]

autocmd FileType python set colorcolumn=81

" Some handy rst formatting remaps

" underline current line with a dash
nnoremap <F5> yyp<C-v>$r-
inoremap <F5> <ESC>yyp<C-v>$r-A

autocmd FileType rst set textwidth=100
