colo noctu
syntax on
set number
set cursorline

hi cursorLine ctermbg=NONE 
hi lineNr ctermfg=grey 
hi cursorLineNr ctermfg=red ctermbg=NONE

" set up NERDTree to be per tab
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeWinSize = 20
autocmd BufWinEnter * :NERDTreeTabsOpen
autocmd BufWinEnter * :NERDTreeMirrorOpen

" enable powerline in airline status bar and make a cool tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" set airline theme
let g:airline_theme = 'distinguished'
" we only need one line for the command height....
:set cmdheight=1
" two spaces for tabs
set expandtab
set shiftwidth=2
set softtabstop=2
" sane buffer closing
nnoremap <leader>q :bp<cr>:bd #<cr>
" view open buffers with F5
nnoremap <F5> :buffers<CR>:buffer<Space>
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap L :bnext<CR>

" Move to the previous buffer
nmap H :bprevious<CR>
 
