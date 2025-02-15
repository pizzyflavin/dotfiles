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

" Keep visible leader indicator by mapping space to default leader
map <space> <leader>

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

" source ~/.config/nvim/plugins/fzf.vim " TODO remove
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/nvim-lspconfig.vim
source ~/.config/nvim/plugins/nvim-treesitter.vim
source ~/.config/nvim/plugins/nvim-cmp.vim
source ~/.config/nvim/plugins/nvim-telescope.vim
source ~/.config/nvim/plugins/nvim-dap.vim
source ~/.config/nvim/plugins/vim-vsnip.vim

call plug#end()

" Trigger the autocmds in plugin config files
doautocmd User PlugLoaded

" Require Lua LSP and Plugin configuration
lua require('lsp')
lua require('plugins')

" ----------------------------------------------------------------------------
" Miscellaneous
" ----------------------------------------------------------------------------

