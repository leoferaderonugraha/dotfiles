" Fix slow load vue files
let g:polyglot_disabled = ['vue']" Plugin Manager
let mapleader=','

" ---------- General settings ----------
syntax on
set expandtab
" set tabstop=4
set softtabstop=4
set shiftwidth=4 smarttab
set number
set list " Show invisible characters


set autoread " Enable auto reload file
set nowrap " Disable auto-wrap


call plug#begin('~/.vim/plugged')
" Customize UI
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
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
    " Plug 'jiangmiao/auto-pairs'
    Plug 'sheerun/vim-polyglot'
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'skammer/vim-css-color' " This plugin takes a lot of times to load
    Plug 'tpope/vim-commentary'
    Plug 'alvan/vim-closetag'
    
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
    Plug 'natebosch/vim-lsc-dart'

" OCaml
    Plug 'ocaml/merlin', { 'do': 'opam install merlin' }

" Rust
    Plug 'rust-lang/rust.vim'

" NodeJS
    Plug 'prisma/vim-prisma'

" LSP Manager (requires nvim)
    Plug 'williamboman/mason.nvim'

" Code Annotations
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Syntax Highlight
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
"nnoremap df :DartFmt<CR>

" ---------- CoC autocomplete config ----------
" symbol rename
nmap <Space>rn <Plug>(coc-rename)
" nmap <silent> <Space>d <Plug>(coc-definition)
nmap <silent> <Space>d :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> <Space>i <Plug>(coc-implementation)
nmap <silent> <Space>f <Plug>(coc-references)
nmap <silent> <Space>t <Plug>(coc-type-definition)
inoremap <silent><expr> <C-Space> coc#refresh()
set completeopt=menu
" ----------

" NERDTree custom shortcut
nmap <Space>n :NERDTreeToggle<CR>

" Switch between tabs
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>

" For find occurences with grep/vimgrep
nnoremap <C-[> :cprev<CR>
nnoremap <C-]> :cnext<CR>

" Clear highlight from last search
nnoremap <Space><Space> :noh<return>

" ---------- FZF shortcut ----------
nnoremap <C-f> :Files<CR>
" nnoremap <C-g> :Ag<CR>
nnoremap <C-g> :Rg<CR>

" use <C-y> when pum is visible to accept the selected completion item
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <TAB> pumvisible() ? coc#pum#next(1) : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? coc#pum#prev(1) : "\<S-TAB>"

" ---------- Managing sessions ----------
"
" Quick write session with F2
map <F2> :mksession! ~/.vim_session <CR>
" And load session with F2
map <F3> :source ~/.vim_session <CR>


" ---------- Utils ----------
"
" Open windows
map <C-q> :tabonly<CR>
" Close all tabs except current
nnoremap <Space>w :Windows<CR>
" Delete from cursor to beginning of line
" nnoremap <S-f> v0d


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
" let g:airline_theme='night_owl'
let g:airline_theme='base16'
let g:NERDTreeHijackNetrw=1 " Disable NERDTree on startup

" ---------- File types configuration ----------
" autocmd FileType dart setlocal shiftwidth=2 tabstop=2 expandtab
" autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

" Movements and camera views
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz
vnoremap <C-j> <C-d>zz
vnoremap <C-k> <C-u>zz
nnoremap n nzz
nnoremap N Nzz
" Scroll wide of the screen to the left
nnoremap <S-h> 2zH
" Scroll wide of the screen to the right
nnoremap <S-l> 2zL
" Lookup to the top / current line to bottom
nnoremap <S-k> zb
" Lookup to the bottom / current line to top
nnoremap <S-j> zt
" Set current line to center
nnoremap <S-m> zz


" Copilot
inoremap <silent><expr> <C-k> copilot#Accept("")
let g:copilot_no_tab_map = 1


" Development
" let g:fzf_action = {'enter': 'tab split'}
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
set number
set relativenumber
set hlsearch
let g:closetag_xhtml_filenames = '*.blade.php'
nnoremap <Space>g :tabnew <bar> :G<CR>
nnoremap <Space>l :Locate $PWD <CR>
vnoremap <Tab> <S->>
vnoremap <S-Tab> <S-<>
set guicursor=n-v-c-i:block " Set cursor to block in normal, visual, command and insert mode
set guicursor-=a:blinkon0 " Disable cursor blinking
set wildmode=longest,list,full " Command-line completion mode
let g:doge_enable_template_support = 1
let g:doge_debug = 1
set statusline+=%F  " Show full file path in statusline

" For typespec
augroup typespec
  au!
  autocmd BufNewFile,BufRead *.tsp   set syntax=typescript
  " autocmd BufNewFile,BufRead *.tsp   set filetype=javascript
augroup END

" ---------- Special Comment Highlight! ----------
autocmd BufEnter *.{c,rs} syntax match SingleLineComment /\/\/.*/ " Match the whole comment line
autocmd BufEnter *.{c,rs} syntax region MultiLineComment start=/\/\*/ end=/\*\// " Match multi-line comments

autocmd BufEnter *.{c,rs} syntax match commentLevel1 /\<\(NOTE\|NOTES\|INFO\)\>/ containedin=SingleLineComment,MultiLineComment
autocmd BufEnter *.{c,rs} syntax match commentLevel2 /\<\(WARN\|WARNING\|TODO\|FIXME\|BUG\|OPTIMIZE\|REVIEW\|TEMP\|DEPRECATED\)\>/ containedin=SingleLineComment,MultiLineComment
autocmd BufEnter *.{c,rs} syntax match commentLevel3 /\<\(XXX\|HACK\|DANGER\)\>/ containedin=SingleLineComment,MultiLineComment

autocmd BufEnter *.{c,rs} syntax match docTags /@\(author\|param\|returns\|return\|throws\|see\|version\|since\|exception\|example\|deprecated\|todo\|link\)/ containedin=SingleLineComment,MultiLineComment

highlight SingleLineComment ctermfg=GRAY guifg=GRAY
highlight MultiLineComment ctermfg=GRAY guifg=GRAY

highlight commentLevel1 ctermfg=CYAN guifg=#80D0D8
highlight commentLevel2 ctermfg=YELLOW guifg=#FFA500
highlight commentLevel3 ctermfg=RED guifg=#FF6F61
highlight docTags ctermfg=GREEN guifg=#4CAF50

" ---------- Code Comment Markers Brief description ----------
" TODO: Indicates something that needs to be done or implemented in the future.
" 
"     Example: // TODO: Refactor this function to improve performance
" 
" FIXME: Marks a part of the code that is known to be problematic or needs to be fixed.
" 
"     Example: // FIXME: Handle edge cases for null input
" 
" XXX: Used to highlight problematic or unclear code that needs attention, often as a reminder to revisit or rewrite it.
" 
"     Example: // XXX: This algorithm is slow and needs optimization
" 
" HACK: Indicates a temporary or unclean solution that needs to be refactored later.
" 
"     Example: // HACK: This workaround is necessary for the current version of the API
" 
" NOTE: Used to add a comment that provides additional information or clarification.
" 
"     Example: // NOTE: This function assumes that the array is always sorted
" 
" BUG: Marks a known bug or issue that needs to be fixed.
" 
"     Example: // BUG: The button click event doesn't trigger on mobile devices
" 
" OPTIMIZE: Suggests that the code could be optimized or improved in terms of performance.
" 
"     Example: // OPTIMIZE: This loop can be made more efficient
" 
" REVIEW: A reminder to review or verify the code at a later time.
" 
"     Example: // REVIEW: Check if the logic here is correct after testing
" 
" TEMP: Indicates that the code is temporary or a placeholder that should be replaced later.
" 
"     Example: // TEMP: Placeholder code until the database connection is ready
" 
" DEPRECATED: Marks code that is outdated and should no longer be used.
"     Example: // DEPRECATED: Use newMethod() instead


" ---------- DocTags Brief description ----------
" @param: Describes a parameter for a function or method.
" @returns: Specifies the return value of a function or method.
" @return: An alternative to @returns, used to describe the return value of a function.
" @throws (or @exception): Describes an exception that a function or method might throw.
" @deprecated: Indicates that a method or class is outdated and suggests an alternative.
" @see: Provides references to related classes, methods, or documentation.
" @author: Specifies the author of the class, method, or code.
" @version: States the version number of the class or method.
" @since: Indicates the version of the software when a feature was introduced.
" @example: Provides an example of how to use a class or method.
" @code: Used to include inline code within documentation comments.
" @link: Creates a hyperlink to related documentation or external resources.
" @todo: Marks a part of the code that requires additional work or improvement.
" @implNote: Provides implementation details or considerations for developers.
" @implSpec: Specifies implementation-specific behavior or constraints for a method.
" @experimental: Marks a feature as experimental, meaning it may change or be removed in future versions.
" ## added by OPAM user-setup for vim / base ## d611dd144a5764d46fdea4c0c2e0ba07 ## you can edit, but keep this line

" ---------- OCaml ----------

let s:opam_share_dir = system("opam var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_available_tools = []
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if isdirectory(s:opam_share_dir . "/" . tool)
    call add(s:opam_available_tools, tool)
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
