set nocompatible
set t_Co=16
filetype off

call plug#begin('~/.vim/plugged')

 " Genereal
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'vim-airline/vim-airline'

 " Go
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

 " Commands
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 Plug 'tommcdo/vim-lion'
 Plug 'neovim/node-host'
 Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}


 " Use release branch
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " Clojure
 Plug 'tpope/vim-salve'
 Plug 'tpope/vim-projectionist'
 Plug 'tpope/vim-dispatch'
 Plug 'tpope/vim-fireplace', {'for': 'clojure'}
 Plug 'kien/rainbow_parentheses.vim'
 Plug 'guns/vim-clojure-highlight'
 Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'}
 Plug 'snoe/clj-refactor.nvim', {'for':'clojure'}
 Plug 'eraserhd/parinfer-rust', {'do':
       \ 'cargo build --release',
       \ 'for': 'clojure'}

 " Javascript
 Plug 'SirVer/ultisnips'
 " Contains pre-programmed snippets
 Plug 'honza/vim-snippets'
 Plug 'mxw/vim-jsx'
 Plug 'pangloss/vim-javascript'


 "Typescript Plugins
 Plug 'HerringtonDarkholme/yats.vim'

 " Color
 Plug 'altercation/vim-colors-solarized'
 Plug 'scrooloose/nerdtree'

 " Elm
 Plug 'ElmCast/elm-vim'

 "GLSL
 Plug 'tikhomirov/vim-glsl'

call plug#end()

" Standard improvements
set nobackup
set nowritebackup
set cmdheight=2

set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


filetype plugin indent on
syntax enable

set encoding=utf-8

set relativenumber
set nu
set cursorline

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

set background=dark
colorscheme solarized
set guifont=Sauce\ Code\ Powerline:h12

set clipboard=unnamedplus

"map escape key
imap jj <Esc>

nmap j gj
nmap k gk

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set autoread

" "f ixes a bug with the terminal where Esc followed by shift O is slow
" set timeout timeoutlen=5000 ttimeoutlen=100
" set modelines=0


"""Support for RABL ruby json templating
au BufRead,BufNewFile *.rabl setf ruby


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"

set autoindent
set smartindent

set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType markdown set shiftwidth=4 tabstop=4
autocmd FileType elm set shiftwidth=4 tabstop=4
autocmd FileType c set cindent
autocmd FileType clojure set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType bash set shiftwidth=3 tabstop=3 softtabstop=3 expandtab
autocmd FileType less set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

set modeline

set wrap "Wrap lines

"set mouse=a

map <Down> gj
map <Up> gk

"For word processing
autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map  j gj
autocmd BufRead *\.txt  map  k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us


"Suport syntax highlighting on rabl
au BufRead,BufNewFile *.rabl setf ruby


"Support syntax highlighting for god configs
au BufNewFile,BufRead *.god set filetype=xml


let vimrplugin_screenplugin = 0

set completeopt=longest,menuone

let g:clojure_align_multiline_strings = 1
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'

" let g:UltiSnipsExpandTrigger="<Enter>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<Shift-Tab>"



" Correct commons typos
:command Wq wq
:command Q q

" clojure
set viminfo+=!

set incsearch
set ignorecase
set smartcase
set hlsearch


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadSquare


" Close nerd tree if it is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Load leader file
source $HOME/.config/nvim/leader.vimrc

"Fold settings
set foldmethod=syntax
set nofoldenable

" Slightly Tweaked rainbow paren setup for solarized colorscheme
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"better split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

set wildignore+=*/.git/*,*/.hg/*,*/node_modules/*
set noswapfile

let g:jsx_ext_required = 0

"Shortcut for piggieback/firepalce with figwheel
command PiggieFig Piggieback (figwheel-sidecar.repl-api/repl-env)

" Sudo save

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Elm

let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

"set auto complete
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

let g:prettier#autoformat = 0


set laststatus=2

let semshi#error_sign = "v:false"


" Add comments support to json
autocmd FileType json syntax match Comment +\/\/.\+$+

" Format on saves
autocmd BufWritePre *.json CocCommand prettier.formatFile


set statusline^=%{coc#status()}
