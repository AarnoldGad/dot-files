set encoding=utf-8
scriptencoding utf-8

set nocompatible

" Plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    " Display
    Plugin 'khaveesh/vim-fish-syntax'
    Plugin 'Yggdroot/indentLine'

    " Behaviour
    Bundle 'matze/vim-move'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'tpope/vim-surround'
    Plugin 'https://github.com/ctrlpvim/ctrlp.vim'

    " Completion and Debug
    Plugin 'ycm-core/YouCompleteMe'
    Plugin 'puremourning/vimspector'

    Plugin 'morhetz/gruvbox'

    " Load as very last one
    Plugin 'ryanoasis/vim-devicons'
call vundle#end()

" Plugins/YCM
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = { 'VimspectorPrompt': [ '.', '->', ':', '<' ] }
let g:ycm_clangd_args = ['--header-insertion=never']
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"
"let g:ycm_language_server = []
"let g:ycm_language_server += [
"    \   { 'name': 'fortran',
"    \     'filetypes': [ 'fortran' ],
"    \     'cmdline': [ 'fortls', '--notify_init', '--hover_signature', '--hover_language', 'fortran', '--use_signature_help', '--lowercase_intrinsics' ],
"    \   },
"    \ ]

" Plugins/vim-cpp-modern (Installed separately from Vundle)
let g:cpp_function_highlight = 1
let g:cpp_attribute_highlight = 1
let g:cpp_member_highlight = 1
"let g:cpp_simple_highlight = 1

" Plugins/CtrlP
let g:ctrlp_show_hidden = 1

" Plugins/gruvbox
let g:gruvbox_italic='1'
let g:gruvbox_transparent_bg='1'

" Indentation
set sw=4 sts=4 ts=4 expandtab
set nosmartindent
set cindent noautoindent
set cinoptions=l1,g0

set backspace=indent,eol,start
set whichwrap+=h,l
set completeopt=menu,preview
set clipboard=

" Search
set hlsearch
set incsearch
set smartcase ignorecase

" Window
set splitbelow splitright
set termwinsize=12x0

" Makes terminal not appear in the buffer list
" So that I don't have to worry when I cycle through buffers
autocmd TerminalWinOpen *
    \ if &buftype == 'terminal' |
    \     setlocal nobuflisted |
    \     setlocal nowrap |
    \     set wfh |
    \ endif

" Behaviour
set mouse=a
set nohidden
set nowrap
set sidescroll=5
set scrolloff=1
set showmatch
set nostartofline
set nojoinspaces
set wildmenu
set wildmode=list:longest

" Display
set relativenumber
set numberwidth=3
set ruler
set showmode
set showcmd
set colorcolumn=100
set laststatus=2

set list
set listchars=tab:→\ ,space:·,eol:¬

set shortmess=a
set statusline=\ %<%f\ %y%m%r%=%(%l/%L,%c%)

set background=dark
set termguicolors
set t_Co=256
colorscheme gruvbox

" Terminal title set to file name
set title
set titlestring=%t
set titleold=

" Don't timeout incomplete commands
set notimeout ttimeout ttimeoutlen=0

" Syntax highlighting
syntax on
filetype on
filetype indent on
filetype plugin on

" Must come after filetype
set tw=79
set fo=crlj

" Shortcuts
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>

if has('macunix')
    " <A-o>
    nnoremap ø o<Esc>0"_D
    " <A-O>
    nnoremap Ø O<Esc>0"_D

    " <A-s>
    nnoremap ß <Esc>:w<CR>
    " <A-w>
    nnoremap ∑ <Esc>:bd<CR>

    " <A-k>
    nnoremap ∆ <Plug>MoveLineUp
    " <A-j>
    nnoremap º <Plug>MoveLineDown

    " <A-h>
    vnoremap ª <Plug>MoveBlockLeft
    " <A-k>
    vnoremap ∆ <Plug>MoveBlockUp
    " <A-j>
    vnoremap º <Plug>MoveBlockDown
    " <A-l>
    vnoremap ¬ <Plug>MoveBlockRight
else
    " FIXME: Update May 2023: Weird things going on with Gnome 44 and keymapping,
    " generating accentuated characters. It still not working exactly properly
    " though

    " Took me a while to figure out why my terminal wouldn't let me use the Alt key
    " I used 'sed -n l' to find out what char my terminal (tilix) was sending
    execute "set <A-o>=o"
"    execute "set <A-O>=O"
    execute "set <A-s>=s"
    execute "set <A-w>=w"
    nmap <A-o> o<Esc>0"_D
"    nmap <A-O> O<Esc>0"_D
    nmap <A-s> :w<CR>
    nmap <A-w> :bd<CR>
    execute "set <A-h>=h"
    execute "set <A-k>=k"
    execute "set <A-j>=j"
    execute "set <A-l>=l"

    nmap <A-k> <Plug>MoveLineUp
    nmap <A-j> <Plug>MoveLineDown

    vmap <A-h> <Plug>MoveBlockLeft
    vmap <A-l> <Plug>MoveBlockRight
    vmap <A-k> <Plug>MoveBlockUp
    vmap <A-j> <Plug>MoveBlockDown

    execute "set <Home>=OH"
    execute "set <End>=OF"
    map <Home> 0
    map <End> $
endif

" Apparently this has to be at the end
set exrc secure

