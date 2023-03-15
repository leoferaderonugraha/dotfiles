" Fix slow load vue files
let g:polyglot_disabled = ['vue']" Plugin Manager


call plug#begin('~/.vim/plugged')
" Customize UI
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    " Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter' 
    Plug 'scrooloose/syntastic'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sheerun/vim-polyglot'
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'skammer/vim-css-color' " This plugin takes a lot of times to load
    
" Autocomplete
    "Plug 'valloric/youcompleteme'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " HTML
    "Plug 'mattn/emmet-vim'
    Plug 'github/copilot.vim'
    
" Themes
    Plug 'cormacrelf/vim-colors-github'
    Plug 'challenger-deep-theme/vim'
    Plug 'https://github.com/cocopon/iceberg.vim'
    Plug 'https://github.com/fcpg/vim-orbital'
    Plug 'https://github.com/wadackel/vim-dogrun'
    Plug 'https://github.com/altercation/vim-colors-solarized'
    Plug 'arcticicestudio/nord-vim'
    
" For working with flutter project
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'natebosch/vim-lsc'
    "Plug 'natebosch/vim-lsc-dart'

" Rust
    Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()


" ---------- Syntastic settings ----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3' " Comment this to depends on system/user's 'python'
" For checking unused imports
let g:syntastic_python_checkers = ['python', 'flake8']


" ---------- vim-cpp-modern settings ----------
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1


" ---------- YCM ----------
" Disable top preview window
" set completeopt-=preview
" Disable YCM
"let g:ycm_show_diagnostics_ui = 0


" For working with flutter project
" The default keymaps of vim-lsc are:
" 
"     'GoToDefinition': <C-]>,
"     'GoToDefinitionSplit': [<C-W>], <C-W><C-]>],
"     'FindReferences': gr,
"     'NextReference': <C-n>,
"     'PreviousReference': <C-p>,
"     'FindImplementations': gI,
"     'FindCodeActions': ga,
"     'Rename': gR,
"     'DocumentSymbol': go,
"     'WorkspaceSymbol': gS,
"     'SignatureHelp': gm,
let g:lsc_auto_map = v:true

" Emmet vim for HTML
" let g:user_emmet_leader_key='<C-M>'

" Use Dart Formatter
nnoremap df :DartFmt<CR>

" ---------- CoC autocomplete config ----------
" symbol rename
nmap <Space>rn <Plug>(coc-rename)
nmap <silent> <Space>d <Plug>(coc-definition)
nmap <silent> <Space>i <Plug>(coc-implementation)
nmap <silent> <Space>r <Plug>(coc-references)
nmap <silent> <Space>t <Plug>(coc-type-definition)
inoremap <silent><expr> <C-Space> coc#refresh()
set completeopt=menu
" ----------

" NERDTree custom shortcut
nmap <Space>n :NERDTreeToggle<CR>

" Switch between tabs
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>

" For find occurences with grep/vimgrep
nnoremap <C-[> :cprev<CR>
nnoremap <C-]> :cnext<CR>

" Clear highlight from last search
nnoremap <Space><Space> :noh<return>

" ---------- FZF shortcut ----------
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Ag<CR>


inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ---------- Managing sessions ----------
"
" Quick write session with F2
map <F2> :mksession! ~/.vim_session <CR> 
" And load session with F3
map <F3> :source ~/.vim_session <CR>     


" ---------- Utils ----------
"
" Open windows
map <C-l> :Windows<CR>


syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number


set autoread " Enable auto reload file
set nowrap " Disable auto-wrap
" Exit insert/edit mode
inoremap jl <ESC>


" ---------- For competitive programming ----------
" Copy the entire content of the current file
map <C-c> :%y+<CR>

" ---------- UI ----------
" colorscheme challenger_deep
" colorscheme dogrun
colorscheme iceberg
set background=dark
set colorcolumn=80,100 " Max line length
set cursorline " Highlight current line
set termguicolors " Enable 24-bit RGB colors
let g:airline_theme='night_owl'
let g:NERDTreeHijackNetrw=1 " Disable NERDTree on startup

" ---------- File types configuration ----------
autocmd FileType dart setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

" Development
" let g:fzf_action = {'enter': 'tab split'}
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
