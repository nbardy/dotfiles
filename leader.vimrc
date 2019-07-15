" Toggle nerdtree
map <Leader>n :NERDTreeToggle<CR>

" \e Exists terminal mode
tnoremap <Leader>e <C-\><C-n>
"un-highlight search
nmap <Leader>s :nohlsearch<cr>

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

