require('telescope').setup{
    defaults = {
        prompt_prefix = "$ "
    }
}

-- Telescope extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')

