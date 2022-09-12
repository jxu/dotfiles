" Custom vim config with my comments 
" (mostly from the ultimate Vim config amix/vimrc)

" => General
set history=1000                " Save more commands
set autoread                    " Read file when changed externally
set autowrite                   " Autosave before commands like :make
set noswapfile                  " No more .swp!


" => VIM UI
set wildmenu                    " Command line completion
set ruler                       " Show current position
set hidden                      " Hide buffers when they are abandoned
set ignorecase                  " Case insensitive matching
set smartcase                   " Smart case matching
set hlsearch                    " Highlight search results
set incsearch                   " Show search terms as you type
set lazyredraw                  " Don't redraw while executing macros
set magic                       " Magic on for regex
set showmatch                   " Show matching brackets
set mouse=a                     " Enable mouse usage (all modes)
set number                      " Show line numbers
set laststatus=2                " Always show status line


" => Colors and Fonts
syntax on                       " Syntax highlighting
set encoding=utf8               " utf8 standard encoding
set t_Co=256                    " Enable 256 terminal colors


" => Text, tab, and indent related
set expandtab                   " Uses spaces for tabs
set tabstop=4                   " Tab 4 columns
set shiftwidth=4                " Reindent 4 columns
set linebreak                   " Soft wrap at `breakat` characters
set wrap                        " Soft wrap at edge of window
set textwidth=0                 " Hard wrap at n characters (0 to disable)
set autoindent                  " Indent from previous line
set smartindent                 " Syntax indent


" => Moving around
set backspace=indent,eol,start  " Sane backspace
set whichwrap+=<,>,h,l,[,]      " Movement wrap between lines

" Navigate long lines as display lines
nnoremap j gj
nnoremap k gk
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>

" Ctrl-Left, Ctrl-Right to switch tabs
nnoremap <C-Left> :tabprev<CR>
nnoremap <C-Right> :tabnext<CR>


" => Shortcuts
set pastetoggle=<F9>            " Toggle paste mode (turn off autoindent)


" => Use Vundle, Vim plug-in manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'pangloss/vim-javascript'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'sukima/xmledit'
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

