Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

