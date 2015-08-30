set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'   " required 
Bundle 'scrooloose/nerdtree' 
Bundle 'scrooloose/nerdcommenter'

Bundle 'Valloric/YouCompleteMe'

" Easy navigation through buffers
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/taglist.vim'


Bundle 'lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'

" won't need for now
"Bundle 'tpope/vim-surround'

" works very well but makes start up slow so disabled for now
"Bundle 'scrooloose/syntastic'   


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""
" CTRL P  "
"""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" Ignore these directories
set wildignore+=*/target/**

"""""""""""""""""""""""""""""""""""""""""
" NERD Tree
"""""""""""""""""""""""""""""""""""""""""
" always open NERDTree when you open vim
autocmd vimenter * NERDTree   
" place cursor in buffer instead of NerdTree 
autocmd VimEnter * wincmd p   
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""
"   Syntastic        "
""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

""""""""""""""""""""""""""""""""""
"       GENERALLY USEFUL         "
""""""""""""""""""""""""""""""""""

" automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc nested source %

" searching
set ignorecase                " ignore case in search
set smartcase                 " do case match if upper/lower chars entered in search
" set incsearch                 " incrimental search
" set gdefault                  " replace all occurances on line by default with s///
set hlsearch                  " highlighting when searching

" tabs 
set expandtab                 " expand tabs to spaces
set tabstop=2                 " tabstop size
set shiftwidth=2              " number of spaces to use for each autoindent step

"
" indenting
"
set autoindent
set cindent                   " c indentation
set cinoptions=               " c indent options (see help)
set backspace=2               " 
 
" wrapping
"set textwidth=0               " endless text width
set wrap                       " wrapping
" In text files, always limit the width of text to 78 characters
"autocmd BufRead *.txt set tw=78

"
" display 
"
set helpheight=50             " default help height
set nolist                    " show/hide tabs and EOL chars
set number                    " show/hide line numbers (nu/nonu)
set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set backspace=indent,start,eol  " repair wired terminal/vim settings ???
"set showcmd                   " show command status
set showmatch                 " jump to matching bracket char when iserting
set ruler                     " show cursor position

"
" colors
"
set background=dark
colorscheme solarized

"
" mouse support 
"
" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

"
" Remapping keys 
"
let mapleader=","

" use tab to switch between windows
"nmap <Tab> <c-w><c-w>

" map F5 to list all buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

""
syntax on 

" code folding
" set nofen
" set foldmethod=indent         " indent based folding

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

" other
set noerrorbells              " no bells in terminal
set undolevels=1000           " number of undos stored
set viminfo='50,"50           " '=marks for x files, "=registers for x files
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags   " where to search for tags file

let g:miniBufExplForceSyntaxEnable = 1

