set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"call plug#begin('~/.vim/plugged')

"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'karb94/neoscroll.nvim'
"Plug 'psliwka/vim-smoothie'
"
"call plug#end()
"
""lua require('neoscroll').setup()
"
"let g:smoothie_no_default_mappings = 1
"
"" https://github.com/psliwka/vim-smoothie
"nnoremap <unique> <C-a> <cmd>call smoothie#do("\<C-D>") <CR>
"vnoremap <unique> <C-a> <cmd>call smoothie#do("\<C-D>") <CR>
"nnoremap <unique> <C-q> <cmd>call smoothie#do("\<C-U>") <CR>
"vnoremap <unique> <C-q> <cmd>call smoothie#do("\<C-U>") <CR>
