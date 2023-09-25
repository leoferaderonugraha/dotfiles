set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" My custom plugins
command! -nargs=+ AsyncExec lua require('async-exec').AsyncExec(<f-args>)
command! Twin lua require('async-exec').create_win()
command! Scratch lua require('tools').makeScratch()

luafile ~/.config/nvim/lua/async-exec.lua
