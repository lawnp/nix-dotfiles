-- general
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- dont want to repeat myself
local opts = { noremap = true, silent = true }
local function remap(mode, lhs, rhs, options)
    options = options or opts
    vim.keymap.set(mode, lhs, rhs, options)
end

-- moving lines in v mode
remap("v", "K", ":m '<-2<CR>gv=gv")
remap("v", "J", ":m '>+1<CR>gv=gv")

remap("n", "J", "mzJ`z")
remap("n", "<C-d>", "<C-d>zz")
remap("n", "<C-u>", "<C-u>zz")

-- yanking to system wide clip board
remap({ "n", "v" }, "<leader>y", [["+y]])
remap("n", "<leader>Y", [["+Y]])

-- prev and next buffer
remap("n", "<leader>q", ":bprev<CR>")
remap("n", "<leader>w", ":bnext<CR>")

-- prev visited buffer
remap("n", "<leader>w", ":b#<CR>")

-- telescope
local builtin = require('telescope.builtin')
remap('n', '<leader>ff', builtin.find_files)
remap('n', '<leader>fg', builtin.live_grep)
remap('n', '<leader>fb', builtin.buffers)
remap('n', '<leader>fh', builtin.help_tags)

-- lsp
remap('n', 'K', '<cmd> lua vim.lsp.buf.hover()<cr>')
remap('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<cr>')

