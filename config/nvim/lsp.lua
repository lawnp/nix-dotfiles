local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.gopls.setup {
    capabilities = capabilities,
}

lspconfig.nil_ls.setup {
    capabilities = capabilities,
}

