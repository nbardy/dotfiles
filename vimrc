set nocompatible
set t_Co=16
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'

 " Genereal
 Plugin 'ctrlpvim/ctrlp.vim'
 Plugin 'Shougo/deoplete.nvim'
 " Plugin 'vim-airline/vim-airline'

 " Commands
 Plugin 'tpope/vim-commentary'
 Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-repeat'
 Plugin 'tommcdo/vim-lion'

 " Clojure
 Plugin 'tpope/vim-fireplace'
 Plugin 'kien/rainbow_parentheses.vim'
 Plugin 'guns/vim-clojure-highlight'

 " Javascript
 Plugin 'mxw/vim-jsx'
 Plugin 'pangloss/vim-javascript'
 
 " Color
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on

syntax enable
set background=dark

set encoding=utf-8

set relativenumber
set nu

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

set background=dark
colorscheme solarized

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

"set auto complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"""Support for RABL ruby json templating
au BufRead,BufNewFile *.rabl setf ruby


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set autoindent
set smartindent
autocmd FileType markdown set shiftwidth=4 tabstop=4
autocmd FileType c set cindent


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


au BufRead,BufNewFile *.clj,*.cljs setf clojure


"Support syntax highlighting for god configs
au BufNewFile,BufRead *.god set filetype=xml

"Add Autocompile for haml files
function HamlToHTML() "Also works for html
   let current_file = shellescape(expand('%:p'))
   let filename = shellescape(expand('%:r'))
   let command = "silent !haml " . current_file . " " . filename
   execute command
endfunction

autocmd BufWritePost,FileWritePost *.haml call HamlToHTML()

let vimrplugin_screenplugin = 0

"neocomplete
" Launches neocomplcache automatically on vim startup.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Use camel case completion.
let g:deoplete#enable_camel_case_completion = 1
" Use underscore completion.
let g:deoplete#enable_underbar_completion = 1
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

" Sets minimum char length of syntax keyword.
let g:deoplete#min_syntax_length = 3

" <TAB>; completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Correct commons typos
:command Wq wq
:command Q q

" clojure
set viminfo+=!

set incsearch
set ignorecase
set smartcase
set hlsearch

"un-highlight search
nmap <Leader>s :nohlsearch<cr>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadSquare


"Close nerd tree if it is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <Leader>n :NERDTreeToggle<CR>

"Fold settings
set foldmethod=syntax
set nofoldenable

"Syntastic settings
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1

"MRI for ruby
let g:syntastic_ruby_checkers=['mri']
"Pylint for pyton
let g:syntastic_python_checkers=['pylint']
"Jshint for javascript
let g:syntastic_javascript_checkers=['jshint']
"CoffeLint for CoffeScript
let g:syntastic_coffee_checkers=['coffeelint']
"gcc for C
let g:syntastic_c_checkers=['gcc']
let g:syntastic_c_gcc="-std=gnu99"

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

"For closing and saving
nmap <Leader>q :q<cr>
nmap <Leader>w :w<cr>
nmap <Leader>W :wq<cr>


"Moves a line above the line above it([m]ove [u]p)
nmap <Leader>mu ddkP
"Moves a line above the line above it([m]ove [d]own)
nmap <Leader>md ddpk

"for vim-rails
map <Leader>sm :RSmodel<cr>
map <Leader>om :REmodel<cr>

map <Leader>vv :RVview 
map <Leader>sv :RSview 
map <Leader>ov :REview 

map <Leader>vc :RVcontroller<cr>
map <Leader>sc :RScontroller<cr>
map <Leader>oc :REcontroller<cr>

map <Leader>vt :RVunittest<cr>
map <Leader>st :RSunittest<CR>

"For creating lines
map <Leader>o o<Esc>k
map <Leader>O O<Esc>j

"For copying lines
map <Leader>y Yp
map <Leader>Y YP

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

set wildignore+=*/.git/*,*/.hg/*,*/node_modules/*
set noswapfile

let g:jsx_ext_required = 0

"Shortcut for piggieback/firepalce with figwheel
command PiggieFig Piggieback (figwheel-sidecar.repl-api/repl-env)
