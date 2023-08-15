" Fix slow load vue files
let g:polyglot_disabled = ['vue']" Plugin Manager


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

" Rust
    Plug 'rust-lang/rust.vim'

" NodeJS
    Plug 'prisma/vim-prisma'

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
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>

" For find occurences with grep/vimgrep
nnoremap <C-[> :cprev<CR>
nnoremap <C-]> :cnext<CR>

" Clear highlight from last search
nnoremap <Space><Space> :noh<return>

" Close all tabs except current
nnoremap <Space>q :tabonly<CR>

" ---------- FZF shortcut ----------
nnoremap <C-f> :Files<CR>
" nnoremap <C-g> :Ag<CR>
nnoremap <C-g> :Rg<CR>


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
map <C-q> :Windows<CR>
" Delete from cursor to beginning of line
" nnoremap <S-f> v0d


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
colorscheme challenger_deep
" colorscheme dogrun
" colorscheme iceberg
set background=dark
set colorcolumn=80,100 " Max line length
set cursorline " Highlight current line
set termguicolors " Enable 24-bit RGB colors
let g:airline_theme='night_owl'
let g:NERDTreeHijackNetrw=1 " Disable NERDTree on startup

" ---------- File types configuration ----------
autocmd FileType dart setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

" Movements and camera views
nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz
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
let g:closetag_xhtml_filenames = '*.blade.php'
nnoremap <Space>g :tabnew <bar> :G<CR>
nnoremap <Space>l :Locate / <CR>
vnoremap <Tab> <S->>
vnoremap <S-Tab> <S-<>
set guicursor=n-v-c-i:block " Set cursor to block in normal, visual, command and insert mode
set guicursor-=a:blinkon0 " Disable cursor blinking
set wildmode=longest,list,full " Command-line completion mode

" Custom vim functions, because why not :)
"" Async run command and show output in a new tab
function! GetSystemOutputAsync(command)
    new " or vnew for vertical split
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile

    let job_id = jobstart(a:command, {'on_stdout': 'OnStdout'})

    if job_id <= 0
        execute "normal i" . "Failed to start job"
    endif

    let new_win_id = win_getid()
    call settabvar(tabpagenr(), 'output_win_id', new_win_id)
endfunction

function! OnStdout(job_id, data, event)
    let cur_win_id = win_getid()
    let job_win_id = gettabvar(tabpagenr(), 'output_win_id')
    
    if a:event == 'stdout' && cur_win_id == job_win_id
        call setline('$', a:data)
    elseif a:event == 'stdout' && cur_win_id != job_win_id
        " Stop the job if the window was closed
        if win_gotoid(job_win_id) == 0
            if exists('a:job_id')
                call jobstop(a:job_id)
            endif
            call settabvar(tabpagenr(), 'output_win_id', 0)
        endif
    endif
endfunction

function! ExecAsyncPrompt()
    let command = input('Execute Command: ')
    call GetSystemOutputAsync(command)
endfunction

command! -nargs=1 ExecAsync call GetSystemOutputAsync(<f-args>)

" Bindings
nnoremap <Space>e :call ExecAsyncPrompt()<CR>
