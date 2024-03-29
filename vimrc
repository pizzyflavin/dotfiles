" Don't try to be vi compatible
set nocompatible


" Plugin Setup

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start plug-ins
call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'crusoexia/vim-monokai'
    Plug 'vim-python/python-syntax'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'},
    Plug 'itchyny/lightline.vim',
    Plug 'sheerun/vim-polyglot'

call plug#end()

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Stop screen from flashing due to visualbell
set t_vb=

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround


" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set noshowmode

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,trail:·,eol:¬
" Uncomment this to enable by default:
set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark

" Generate closing brace with opening brace
"inoremap { {}<ESC>i

" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" ===========================================================================
" Custom Vim Commands
" ===========================================================================
command Vterm vertical terminal

" ===========================================================================
" FileType Specific Settings
" ===========================================================================
filetype on
" Makefiles
" =========
" Don't expand tabs and set width to 8
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

autocmd FileType cpp,c set expandtab shiftwidth=4 softtabstop=4

" ===========================================================================
" Make/Build Settings
" ===========================================================================
augroup auto_make
    autocmd!
    autocmd FileType cpp,c :autocmd! auto_make BufWritePost <buffer> :silent make | redraw!
    autocmd QuickFixCmdPost *make* cwindow
augroup END

" ===========================================================================
" Plugin Configuration
" ===========================================================================

" Nerdtree
" ========
" Update status bar when opening NERDTree
"autocmd VimEnter * NERDTree | call lightline#update()

" Monokai color scheme
" ====================
colorscheme monokai

" Python syntax
" =============
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_funcs_kwarg = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_doctests = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
let g:python_highlight_file_headers_as_comments = 1

" YouCompleteMe
" -------------
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" Lightline
" ---------
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename'] ]
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

