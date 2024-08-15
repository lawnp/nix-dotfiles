require('nvim-treesitter.configs').setup {
  ensure_installed = {},

  auto_install = false,

  highlight = { 
    enable = true,

    disable = {
      "vimdoc",
    },
  },

  indent = { enable = true },
}
