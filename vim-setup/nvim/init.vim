set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Handwritten plugins
luafile ~/.config/nvim/lua/async-exec.lua
