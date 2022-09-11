local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local flags = {
  debounce_text_changes = 150,  
}

local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(base_capabilities)

local function setup_lsp_clang()
  require 'lspconfig'.clangd.setup {
    cmd = { '/usr/bin/clangd' },
    flags = flags,
    on_attach = on_attach,
    capabilities = capabilities,
  } 
end

local function setup()
  setup_lsp_clang()
end

return {
  setup = setup
}

