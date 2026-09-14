local capabilities = vim.lsp.protocol.make_client_capabilities()

-- gopls
vim.lsp.config('gopls', {
  capabilities = capabilities,
})

-- nil_ls (nix)
vim.lsp.config('nil_ls', {
  capabilities = capabilities,
  settings = {
    nil_ls = {
      formatter = { command = { "nixfmt" } },
    },
  }
})

-- lua_ls
vim.lsp.config('lua_ls', {
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
})

-- rust_analyzer
vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
})

-- clangd
vim.lsp.config('clangd', {
  capabilities = capabilities,
})

-- zls
vim.lsp.config('zls', {
  capabilities = capabilities,
})

-- pyright
vim.lsp.config('pyright', {
  capabilities = capabilities,
})

-- jdtls
  vim.lsp.config('jdtls', {
    capabilities = capabilities,
    cmd = {
      'jdtls',
      '-data', vim.fn.expand('~/.cache/jdtls/workspace') .. '/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
    },
    root_markers = { 'build.gradle', 'build.gradle.kts', 'pom.xml', '.git' },
    settings = {
      java = {
        configuration = {
          runtimes = {
            { name = "JavaSE-21", path = vim.fn.expand("$JAVA_HOME") },
          }
        }
      }
    }
  })

-- ts_ls (renamed from tsserver)
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  init_options = {
    plugins = {},
  },
  filetypes = {
    "javascript",
    "typescript",
  },
})

-- angularls
vim.lsp.config('angularls', {
  capabilities = capabilities,
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    vim.fn.expand("$PWD/node_modules"),
    "--ngProbeLocations",
    vim.fn.expand("$PWD/node_modules"),
  },
  root_markers = { "angular.json", ".git" },
})

-- Enable all configured LSP servers
vim.lsp.enable({
  'gopls',
  'nil_ls',
  'lua_ls',
  'rust_analyzer',
  'clangd',
  'zls',
  'pyright',
  'jdtls',
  'ts_ls',
  'angularls',
})
