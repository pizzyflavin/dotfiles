Plug 'dracula/vim', { 'as': 'dracula' }

" Overrides autocmds run after plug#end()
augroup DraculaOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme dracula
augroup end

