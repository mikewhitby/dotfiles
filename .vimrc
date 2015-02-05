" vim: tw=0 fdm=marker

" vundle {{{1
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

" vim settings {{{1
set encoding=utf-8 nobomb                                           " use utf-8 encoding
set fileformats=unix                                                " use unix line endings
syntax enable                                                       " enable syntax highlighting
colorscheme monokai                                                 " use the monokai colourscheme
set ruler                                                           " show the line number ruler
set laststatus=2                                                    " always show the statusbar
set noshowmode                                                      " don't show the mode in the status bar
set wildmenu wildmode=full                                          " use the tab-completion wildmenu and have it show all results
set scrolloff=10 sidescrolloff=2 sidescroll=1                       " set display to show 10 lines top/bottom and 2 lines left/right
set nowrap                                                          " disable text wrapping
" show trailing tabs and spaces
set list listchars=tab:▸-,trail:·,eol:¬,nbsp:¬
set hlsearch incsearch gdefault ignorecase smartcase                " highlight search matches, show as you type, global, smart case
set showmatch                                                       " briefly flash to matching brace when inserted
set autoindent smartindent                                          " indent the next line the same as the current line, and indent control structures
set expandtab tabstop=4 shiftwidth=4                                " when I press tab, insert 4 spaces instead, do the same for indenting
set backspace=indent,eol,start                                      " 'untab' these with backspace
set noswapfile nobackup nowb                                        " disable all swap and backup files
set undofile undodir=~/.vim/undo,~/.tmp,~/tmp,/var/tmp,/tmp         " use a persistent undo file
if exists('+relativenumber')
    set relativenumber number                                       " use hybrid line numbering
endif
set hidden                                                          " allow hidden modified buffers
set mouse=a                                                         " allow using the mouse
set history=1000                                                    " remember the last 1000 commands
set title                                                           " make terminal vim set the title
set visualbell                                                      " don't bloody beep
set gcr=a:blinkon0                                                  " disable cursor blink
set cul cuc                                                         " show the cursor line and column only when in normal mode
set autoread                                                        " automatically re-read changed files
set showcmd                                                         " show visual selection info as we go
if has('gui_running')
    set guioptions=rb                                               " remove all menubars etc
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11               " powerline patched font
    let g:airline_powerline_fonts = 1                               " use powerline fonts in airline
endif

" autocmd {{{1
:autocmd InsertEnter * set nocul nocuc
:autocmd InsertLeave * set cul cuc
autocmd! bufwritepost .vimrc source %

" plugin config {{{1

" airline {{{2
let g:airline#extensions#ctrlp#show_adjacent_modes = 0              " dont shown adjacent CtrlP modes (buf, mru, etc)
let g:airline#extensions#tabline#enabled = 1                        " show "tabline" at the top
let g:airline#extensions#tabline#fnamemod = ':t'                    " show only filename for the "tab" name

" ctrlp {{{2
let g:ctrlp_lazy_update = 100                                       " allow 100 msec before updating results
let g:ctrlp_use_caching = 1                                         " allow the use of a cache file
let g:ctrlp_clear_cache_on_exit = 0                                 " don't clear the cache on exit
let g:ctrlp_max_files = 0                                           " no limit on max amount of files
" use pymatcher as a ctrlp matcher
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
call ctrlp_bdelete#init()                                           " initialise ctrlp buffer delete plugin
let g:ctrlp_working_path_mode = 'rw'                                " preserve ctrlp root when opening files outside

" ag {{{2
if executable('ag')
    " ignore .git when using :Ag
    let g:ag_prg="ag --vimgrep -U --ignore '.git'"
    " use ag as a ctrlp indexer
    let g:ctrlp_user_command = 'ag %s -U -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" vdebug {{{2
let g:vdebug_options = {
\   'port': 9002,
\   'server': '0.0.0.0',
\   'path_maps': {'/vagrant/site': '/Users/mwhitby/Sites2/dsm/site'}
\}

" tagbar {{{2
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

" file type associations {{{1
autocmd BufNewFile,BufRead,BufWrite *.md set filetype=markdown

" key mappings {{{1
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
nnoremap <C-q> :Bclose<CR>
nnoremap § :NERDTreeToggle<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap ± :TagbarToggle<CR>
let g:tagbar_map_togglefold = ["O", "za"]
let g:tagbar_map_jump = "o"
