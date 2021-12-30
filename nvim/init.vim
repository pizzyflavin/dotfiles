" ****************************************************************************
"
" ~ Personal vim config file of Ricky Rininger ~
"
" ****************************************************************************

" ----------------------------------------------------------------------------
" General Settings
" ----------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set number
set relativenumber
set termguicolors
set title
set ignorecase
set nowrap
set list
set listchars=tab:▸\ ,trail:·,eol:¬
set scrolloff=8
set splitright
set confirm
set showcmd

" ----------------------------------------------------------------------------
" Key maps
" ----------------------------------------------------------------------------

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin Initialization
call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/dracula.vim

call plug#end()

" Trigger the autocmds in plugin config files
doautocmd User PlugLoaded

" ----------------------------------------------------------------------------
" Miscellaneous
" ----------------------------------------------------------------------------

