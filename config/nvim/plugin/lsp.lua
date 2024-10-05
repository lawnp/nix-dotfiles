local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.gopls.setup {
  capabilities = capabilities,
}

lspconfig.nil_ls.setup {
  capabilities = capabilities,

  settings = {
    nil_ls = {
      formatter = { command = { "nixfmt" } },
    },
  }
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
    }
  }
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  capabilities = capabilities,
}

lspconfig.zls.setup {
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  capabilities = capabilities,
}
