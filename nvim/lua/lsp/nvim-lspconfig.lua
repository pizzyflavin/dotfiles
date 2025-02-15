-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- NOTE: These currently conflict with existing file and search commands
  -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'cmake', 'jsonls', 'pyright', 'rust_analyzer', 'ts_ls' }
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in pairs(servers) do
  if lsp == 'clangd' then
    require('lspconfig')[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { 'clangd',
              '--query-driver=' ..
                os.getenv('HOME') ..
                '/tools/gcc-arm-none-eabi/bin/arm-none-eabi-gcc'
      },
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      }
    }
  else
    require('lspconfig')[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      }
    }
end
end

