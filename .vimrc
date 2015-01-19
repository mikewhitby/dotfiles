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
Plugin 'StanAngeloff/php.vim'
call vundle#end()
filetype plugin indent on

"----------------- SETTINGS -----------------
let g:ctrlp_lazy_update = 100                       " allow 100 msec before updating results
let g:ctrlp_use_caching = 1                         " allow the use of a cache file
let g:ctrlp_clear_cache_on_exit = 0                 " don't clear the cache on exit
let g:ctrlp_max_files = 0                           " no limit on max amount of files
" use ag as a CtrlP indexer
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
" Use pymatcher as a CtrlP matcher
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
syntax enable                                       " enable syntax highlighting
colorscheme monokai                                 " use the monokai colourscheme
set cursorline                                      " highlight the line the cursor is on
set ruler                                           " show the line number ruler
set laststatus=2                                    " always show the statusbar
set wildmenu                                        " use the tab-completion wildmenu...
set wildmode=full                                   " ...and have it show all results
set scrolloff=10                                    " ensure 10 lines are shown above/below the current line
set nowrap                                          " disable text wrapping
" show trailing tabs and spaces
set list listchars=tab:\ \ ,trail:·
set hlsearch                                        " highlight search matches
set incsearch                                       " show search as you type
set gdefault                                        " global pattern by default
set ignorecase                                      " case insensitive search
set smartcase                                       "  ..unless the string has uppercase in it
set showmatch                                       " briefly flash to matching brace when inserted
set autoindent                                      " indent the next line the same as the current line...
set smartindent                                     " ...and alter the indent for control structures etc
set expandtab                                       " change tabs to spaces
set tabstop=4                                       " class this many spaces as one tab
set shiftwidth=4                                    " when altering indent, use this many spaces for one tab
set backspace=indent,eol,start                      " 'untab' these with backspace
set softtabstop=4                                   " unsure how this differs to the other tab settings tbh
set noswapfile                                      " disable swap file
set nobackup                                        " don't save backup files
set nowb                                            " don't save a backup before writing
set undofile                                        " use a persistant undo file...
set undodir=~/.vim/undo,~/.tmp,~/tmp,/var/tmp,/tmp  " ...which is saved in one of these dirs
" automatically reload .vimrc on change
autocmd! bufwritepost .vimrc source %
if exists('+relativenumber')
    set relativenumber                              " use relative numbers...
    set number                                      " ...and normal numbers (hybrid numbering)
endif
set hidden                                          " allow hidden modified buffers
set mouse=a                                         " allow using the mouse
" class *.md as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

"----------------- KEY MAPPINGS -----------------
let mapleader=","
" buffers - previous, next, close, new
nnoremap <silent> <Leader>[ :bp<CR>
nnoremap <silent> <Leader>] :bn<CR>
nnoremap <silent> <Leader>c :Bclose<CR>
nnoremap <silent> <Leader>x :Bclose!<CR>
nnoremap <silent> <Leader>n :enew<CR>
" open NERDTree
nnoremap § :NERDTreeToggle<CR>
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" make search regex by default
nnoremap / /\v
