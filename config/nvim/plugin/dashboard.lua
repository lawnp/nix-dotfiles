local function disable_whitespace_highlighting()
  vim.cmd [[highlight clear ExtraWhitespace]]
  vim.cmd [[match none]]

  -- turn of indentation indicator
  require("ibl").setup { enabled = false }
end

local function enable_whitespace_highlighting()
  vim.cmd [[highlight ExtraWhitespace ctermbg=cyan guibg=cyan]]
  vim.cmd [[match ExtraWhitespace /\s\+$/]]
  require("ibl").setup { enabled = true }
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  callback = disable_whitespace_highlighting
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = '<buffer>',
  callback = enable_whitespace_highlighting
})

require('dashboard').setup {
  theme = 'hyper',
  disable_move = true,
  shortcut_type = 'number',
  config = {
    disable_move = true,
    header = { "Supp" },
    week_header = {
      enable = true,
    },
    packages = {
      enable = false,
    },
    shortcut = {},
  }
}
