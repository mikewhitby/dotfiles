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
Plugin 'joonty/vdebug'
Plugin 'mkitt/tabline.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'vim-scripts/Align'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

"----------------- SETTINGS -----------------
set encoding=utf-8 nobomb                                           " use utf-8 encoding
set fileformats=unix                                               " use unix line endings
let g:ctrlp_lazy_update = 100                                       " allow 100 msec before updating results
let g:ctrlp_use_caching = 1                                         " allow the use of a cache file
let g:ctrlp_clear_cache_on_exit = 0                                 " don't clear the cache on exit
let g:ctrlp_max_files = 0                                           " no limit on max amount of files
" use ag as a ctrlp indexer
if executable('ag')
    let g:ag_prg="ag --vimgrep -U --ignore '.git'"
    let g:ctrlp_user_command = 'ag %s -U -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
" use pymatcher as a ctrlp matcher
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
call ctrlp_bdelete#init()                                           " initialise ctrlp buffer delete plugin
let g:ctrlp_working_path_mode = 'rw'                                " preserve ctrlp root when opening files outside
syntax enable                                                       " enable syntax highlighting
colorscheme monokai                                                 " use the monokai colourscheme
set ruler                                                           " show the line number ruler
set laststatus=2                                                    " always show the statusbar
set wildmenu                                                        " use the tab-completion wildmenu...
set wildmode=full                                                   " ...and have it show all results
set scrolloff=10                                                    " ensure 10 lines are shown above/below the current line
set sidescrolloff=2                                                 " same sideways but only 2 chars
set sidescroll=1                                                    " and when we do scroll sideways do it by 1 char at a time
set nowrap                                                          " disable text wrapping
" show trailing tabs and spaces
set list listchars=tab:▸-,trail:·,eol:¶,nbsp:¬
set hlsearch                                                        " highlight search matches
set incsearch                                                       " show search as you type
set gdefault                                                        " global pattern by default
set ignorecase                                                      " case insensitive search
set smartcase                                                       "  ..unless the string has uppercase in it
set showmatch                                                       " briefly flash to matching brace when inserted
set autoindent                                                      " indent the next line the same as the current line...
set smartindent                                                     " ...and alter the indent for control structures etc
set expandtab                                                       " change tabs to spaces
set tabstop=4                                                       " class this many spaces as one tab
set shiftwidth=4                                                    " when altering indent, use this many spaces for one tab
set backspace=indent,eol,start                                      " 'untab' these with backspace
set softtabstop=4                                                   " unsure how this differs to the other tab settings tbh
set noswapfile                                                      " disable swap file
set nobackup                                                        " don't save backup files
set nowb                                                            " don't save a backup before writing
set undofile                                                        " use a persistant undo file...
set undodir=~/.vim/undo,~/.tmp,~/tmp,/var/tmp,/tmp                  " ...which is saved in one of these dirs
" automatically reload .vimrc on change
autocmd! bufwritepost .vimrc source %
if exists('+relativenumber')
    set relativenumber                                              " use relative numbers...
    set number                                                      " ...and normal numbers (hybrid numbering)
endif
set hidden                                                          " allow hidden modified buffers
set mouse=a                                                         " allow using the mouse
" class *.md as markdown
autocmd BufNewFile,BufRead,BufWrite *.md set filetype=markdown
set history=1000                                                    " remember the last 1000 commands
set title                                                           " make terminal vim set the title
set visualbell                                                      " don't bloody beep
set gcr=a:blinkon0                                                  " disable cursor blink
" show the cursor line and column only when in normal mode
set cul cuc
:autocmd InsertEnter * set nocul nocuc
:autocmd InsertLeave * set cul cuc
set autoread                                                        " automatically re-read changed files
set showcmd                                                         " show visual selection info as we go
if has('gui_running')
    set guioptions=rb                                               " remove all menubars etc
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11               " powerline patched font
    let g:airline_powerline_fonts = 1                               " use powerline fonts in airline
endif
set noshowmode                                                      " don't show the mode in the status bar
" vdebug options
let g:vdebug_options = {
\   'port': 9002,
\   'server': '0.0.0.0',
\   'path_maps': {'/vagrant/site': '/Users/mwhitby/Sites2/dsm/site'}
\}
let g:airline#extensions#ctrlp#show_adjacent_modes = 0              " dont shown adjacent CtrlP modes (buf, mru, etc)
let g:airline#extensions#tabline#enabled = 1                        " show "tabline" at the top
let g:airline#extensions#tabline#fnamemod = ':t'                    " show only filename for the "tab" name
" remove the file % from airline
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['linenr', ':%c '])
endfunction
autocmd VimEnter * call AirlineInit()
let g:ctrlp_tjump_only_silent = 1
" tagbar php config
let g:tagbar_type_php  = {
\   'ctagstype' : 'php',
\   'kinds'     : [
\       'i:interfaces',
\       'c:classes',
\       'd:constant definitions',
\       'f:functions'
\    ]
\}
let g:tagbar_autofocus = 1                                          " focus tagbar on open

"----------------- KEY MAPPINGS -----------------
" buffers - previous, next, close
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
nnoremap <C-q> :Bclose<CR>
" open NERDTree
nnoremap § :NERDTreeToggle<CR>
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" tagbar
nmap ± :TagbarToggle<CR>
