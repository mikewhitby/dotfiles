"----------------- PLUGINS -----------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

"----------------- SETTINGS -----------------

"ctrlp
let g:ctrlp_lazy_update = 100
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0

"ag
"ag seems to need -U at the moment, think this is a bug
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    if exists(':Ag')
        let g:ag_prg="ag --vimgrep"
    endif
    if exists(':CtrlP')
        let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
    endif
endif

"pymatcher
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

"display
syntax enable
colorscheme monokai
set cursorline
set ruler
set laststatus=2
set wildmenu
set wildmode=full
set scrolloff=10
set nowrap
" show trailing tabs and spaces
set list listchars=tab:\ \ ,trail:·

"search
set hlsearch "highlight search matches
set incsearch "show search as you type
set gdefault "global pattern by default
set ignorecase "case insensitive search
set smartcase " ..unless the string has uppercase in it

"editing
set showmatch "briefly flash to matching brace when inserted

"indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set softtabstop=4

"backup / swap / undo
set noswapfile
set nobackup
set nowb
set undofile
set undodir=~/.vim/undo,~/.tmp,~/tmp,/var/tmp,/tmp

"vimrc auto reload
autocmd! bufwritepost .vimrc source %

"relative line numbers
if exists('+relativenumber')
    set relativenumber
    set number
endif

"clipboard
set clipboard=unnamed

"buffer stuff
set hidden "allow hidden modified buffers

"mouse (for now)
set mouse=a

"file types
autocmd BufNewFile,BufRead *.md set filetype=markdown

"----------------- KEY MAPPINGS -----------------

let mapleader=" "
nnoremap <silent> <Leader>[ :bp<CR>
nnoremap <silent> <Leader>] :bn<CR>
nnoremap <silent> <Leader>c :Bclose<CR>
nnoremap § :NERDTreeToggle<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nnoremap / /\v
vnoremap / /\v
