set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""
" CTRL P
""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" Ignore these directories
set wildignore+=*/target/**
" set wildignore+=*/vendor/**

" Search in certain directories a large project (hardcoded for now)
cnoremap %proj <c-r>=expand('~/Projects/some-project')<cr>
" ga = go api
map <Leader>ga :CtrlP %proj/api/<cr>
" gf = go frontend
map <Leader>gf :CtrlP %proj/some/long/path/to/frontend/code/<cr>


"""""""""""""""""""""""""""""""""""""""""
" NERD Tree
"""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



""""""""""""""""""""""""""""""""
"      FACEBOOK-SPECIFIC       "
""""""""""""""""""""""""""""""""
set expandtab                 " expand tabs to spaces
set shiftwidth=2              " number of spaces to use for each autoindent step
set autoindent

""""""""""""""""""""""""""""""""""
"       GENERALLY USEFUL         "
""""""""""""""""""""""""""""""""""

" automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" searching
set ignorecase                " ignore case in search
set smartcase                 " do case match if upper/lower chars entered in search
" set incsearch                 " incrimental search
" set gdefault                  " replace all occurances on line by default with s///
set hlsearch                  " highlighting when searching

" indenting
set cindent                   " c indentation
set cinoptions=               " c indent options (see help)
set tabstop=2                 " tabstop size
set backspace=2               " 
 
" wrapping
"set textwidth=0               " endless text width
set wrap                       " wrapping
" In text files, always limit the width of text to 78 characters
autocmd BufRead *.txt set tw=78

" display 
set helpheight=50             " default help height
set nolist                    " show/hide tabs and EOL chars
set number                    " show/hide line numbers (nu/nonu)
set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set backspace=indent,start,eol  " repair wired terminal/vim settings ???
set showcmd                   " show command status
set showmatch                 " jump to matching bracket char when iserting
set showmode                  " show editing mode in status (-- INSERT --)
set ruler                     " show cursor position

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

" backups
set nobackup                    " create backup when saving file
"set backupdir=~/.vimbackup    " use backup directory
"set backupext=.bak            " postfix with this extension

" code folding
" set nofen
" set foldmethod=indent         " indent based folding

" other
set noerrorbells              " no bells in terminal
set undolevels=1000           " number of undos stored
set viminfo='50,"50           " '=marks for x files, "=registers for x files
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags   " where to search for tags file

" make split windows easier to navigate
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-m> <C-w>_

set background=dark
au BufNewFile,BufRead *.tw set filetype=python
au BufNewFile,BufRead *.cconf set filetype=python
au BufNewFile,BufRead *.thrift set filetype=cpp

" if exists('+colorcolumn')
" set colorcolumn=80
"else
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

filetype plugin on 
let g:pydiction_location = '~/pydiction/complete-dict'


set winwidth=80
nmap <Tab> <c-w><c-w>
autocmd WinEnter * wincmd =
autocmd VimResized * wincmd =

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" map F5 to list all buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
syntax on
