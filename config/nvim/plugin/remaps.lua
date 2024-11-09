-- general
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- dont want to repeat myself
local opts = { noremap = true, silent = true }
local function remap(mode, lhs, rhs, options)
  options = options or opts
  vim.keymap.set(mode, lhs, rhs, options)
end

-- open netrw
remap("n", "<leader>e", ":E<CR>")

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
remap('n', '<leader>fr', builtin.lsp_references)

-- lsp
remap('n', 'K', '<cmd> lua vim.lsp.buf.hover()<cr>')
remap('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<cr>')
remap('n', '<leader>r', '<cmd> lua vim.lsp.buf.rename()<cr>')

-- auto comment in visual select mode
remap('n', '<leader>r', '<cmd> lua vim.lsp.buf.rename()<cr>')

function Trim(str)
  return str:gsub("^%s+", "")
end

-- TODO: add same indentation level if commenting accross blocks
-- TODO: fix for c comments
function ToggleComment()
  local startLinePos = vim.fn.getpos("v")[2]
  local endLinePos = vim.fn.getpos(".")[2]

  local commentString = vim.bo.commentstring
  local trimedCommentString = commentString:gsub("%%s", "")

  local commentMode = not vim.startswith(Trim(vim.fn.getline(startLinePos)), trimedCommentString)

  for i = startLinePos, endLinePos do
    local line = vim.fn.getline(i)
    local indentation = line:match("^(%s*)")
    local newLine

    if commentMode then
      newLine = indentation .. commentString:format(Trim(line))
    else
      newLine = indentation .. line:gsub(indentation, "", 1):gsub(trimedCommentString, "", 1)
    end

    vim.fn.setline(i, newLine)
  end
end

remap({'n', 'v'}, '<leader>c', '<cmd> lua ToggleComment()<cr>')
