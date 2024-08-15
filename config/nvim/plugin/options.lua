vim.o.clipboard = "unnamedplus"

vim.opt.guicursor = ""

vim.o.number = true
vim.o.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.cmd [[highlight ExtraWhitespace ctermbg=cyan guibg=cyan]]
vim.cmd [[match ExtraWhitespace /\s\+$/]]

vim.opt.list = false

-- vim.cmd [[colorscheme duskfox]]
