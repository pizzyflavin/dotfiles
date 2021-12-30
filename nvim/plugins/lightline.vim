Plug 'itchyny/lightline.vim',

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

" Lightline Color Scheme Handling
augroup LightlineColorscheme
    autocmd!
    autocmd ColorScheme * call s:onColorSchemeChange(expand("<amatch>"))
augroup END

function! s:onColorSchemeChange(scheme)
    " Try a scheme provided already
    execute 'runtime autoload/lightline/colorscheme/'.a:scheme.'.vim'
    if exists('g:lightline#colorscheme#{a:scheme}#palette')
        let g:lightline.colorscheme = a:scheme
    else " Try falling back to a known color scheme
        let l:colors_name = get(s:color_scheme_map, a:scheme, '')
        if empty(l:colors_name)
            return
        else
            let g:lightline.colorscheme = l.colors_name
        endif
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction


