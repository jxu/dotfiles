" Custom vim config with my comments (Mostly from the ultimate Vim config amix/vimrc)

" => General
set history=1000                " Save more commands
set autoread                    " Read file when changed externally
set autowrite                   " Automatically save before commands like :next and :make
"command W w !sudo tee % > /dev/null     " sudo save file
set noswapfile                  " No more .swp!

" Ensure options work with the Vim-related packages available in Debian.
runtime! debian.vim

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" => VIM UI
"set so=7                       " Lines above/below cursor when scrolling
set wildmenu                    " Command line completion
set ruler                       " Show current position
"set cmdheight=2                " Height of command bar
set hidden                      " Hide buffers when they are abandoned
set backspace=indent,eol,start  " Sane backspace
set whichwrap+=<,>,h,l,[,]      " Backspace wrap
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set hlsearch                    " Highlight search results
set incsearch                   " Show search terms as you type
set lazyredraw                  " Don't redraw while executing macros
set magic                       " Magic on for regex
set showmatch                   " Show matching brackets
"set mat=2                      " Tenths of a second to blink when matching brackets
"set foldcolumn=0               " Extra margin on left size
set mouse=a                     " Enable mouse usage (all modes)
set number                      " Show line numbers
"let loaded_matchparen = 1      " Disable highlighting matching parens


" => Colors and Fonts
syntax on                       " Syntax highlighting
set encoding=utf8               " utf8 standard encoding, en_US standard language
set t_Co=256                    " Enable 256 terminal colors


" => Text, tab, and indent related
set expandtab                   " Uses spaces for tabs
set smarttab
set tabstop=4                   " Tab 4 columns
set shiftwidth=4                " Reindent 4 columns
set lbr                         " Visual word wrapping at `breakat`
"set tw=500                     " Linebreak on 500 characters

set autoindent
"set smartindent                " Disabled because typing '#' unindents (and other)
set wrap


" => Moving around
"map j gj                       " Treat long lines as break lines
"map k gk
"map <space> /                  " Map Space to search
map <c-space> ?                 " Map Ctrl-Space to backwards search
" Ctrl-Left and Ctrl-Right to switch tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


" => Status line
set laststatus=2                " Always show status line
set showcmd                     " Show (partial) command in status line


" => Shortcuts
set pastetoggle=<F9>            " Toggle paste mode (turn off autoindent)
map <C-n> :NERDTreeToggle<CR>   " Open NERDTree with Ctrl-n


" => Use Vundle, Vim plug-in manager
"set nocompatible  " Disabled since resets whichwrap
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'pangloss/vim-javascript'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'xavierd/clang_complete'
"Plugin 'gabrielelana/vim-markdown'
call vundle#end()
filetype plugin indent on       " Filetype plugins

" Colorscheme 
colorscheme vim-monokai-tasty   " After Vundle 


" Plugin settings
let g:jedi#popup_on_dot = 0     " Disable autocomplete on '.'

let g:syntastic_python_checkers=["flake8"]
" Syntastic ignore PEP8 guidelines 
" E2: Whitespace  E3: Blank line  E7: Statement  W2: Whitespace warning
" E12x: over-indent and under-indent  W3: Blank line warning
" https://pycodestyle.readthedocs.io/en/latest/intro.html#error-codes
let g:syntastic_python_flake8_args="--ignore=E127,E128,E2,E3,E7,W2,W3"

let g:clang_library_path='/usr/lib/llvm-10/lib'