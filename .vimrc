" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the best vim plugin manager
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'


" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:

" File browser
Bundle 'scrooloose/nerdtree'

Plugin 'tpope/vim-commentary'

" Class/module browser
Plugin 'majutsushi/tagbar'

" Code and files fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-surround'

Plugin 'tomasiser/vim-code-dark'

Plugin 'tmhedberg/SimpylFold'

Plugin 'IndexedSearch'

Plugin 'klen/python-mode'

Plugin 'vim-syntastic/syntastic'

" Plugin 'ycm-core/YouCompleteMe'


" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" highlight cursor line and column
set cursorline
" set cursorcolumn
set encoding=utf-8
" line numbers
set nu
" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" always show status bar
set laststatus=2
" incremental search
set incsearch
" highlighted search results
set hlsearch
" search ignore case
set ignorecase
" syntax highlight on
syntax on
" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
        let &t_Co = 256
    colorscheme codedark
    let g:airline_theme = 'codedark'
else
    colorscheme delek
endif
" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Folding
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" YouCompleteMe-----------------------
" Code lookup on F3
" execute "set <F3>=<C-v><F3>"
" map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_server_python_interpreter='python3'
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_confirm_extra_conf = 0


" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
execute "set <M-1>=\e1"
map <M-1> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <M-2> :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" vim schelpp \ drag visual--------------
"vmap <unique> <C-up>    <Plug>SchleppUp
"vmap <unique> <C-down>  <Plug>SchleppDown
"vmap <unique> <C-left>  <Plug>SchleppLeft
"vmap <unique> <C-right> <Plug>SchleppRight


" Syntastic------------------------------
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" Show icons
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'



" Python-mode ------------------------------

" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 1
" disable auto documentation
let g:pymode_doc = 0
" show doc \ definition on L
"let g:pymode_rope_show_doc_bind = 'L'
" turn off autocompletion
let g:pymode_rope_completion = 1
" rename bind
"let g:pymode_rope_rename_bind = 'R'


" Airline-----------------------------------
let g:airline_powerline_fonts = 1


" Autoclose: fix for arrow keys--------------
let g:AutoClosePreservDotReg = 0

" ==============================
" File formats specific settings
" ==============================

" Python setup indent setup
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" JS, HTML, CSS indent setup
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
