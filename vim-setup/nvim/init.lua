-- Set runtimepath
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim'
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim/after'

-- Set packpath
vim.o.packpath = vim.o.runtimepath

-- Source the Vim configuration file
vim.cmd('source ~/.vimrc')

-- load mason
require("mason").setup()

-- Load the handwritten plugins
dofile(vim.fn.stdpath('config') .. '/lua/async-exec.lua')
