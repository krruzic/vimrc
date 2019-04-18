let base16colorspace=256

set term=screen-256color
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
syntax on
set number
set cursorline
set t_ut=

" set up colorscheme
hi CursorLine gui=underline guifg=NONE guibg=NONE
hi LineNr guifg=grey
hi CursorLineNr guifg=orange
colo base16-tomorrow-night

" Set up MRU
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>
" ctrl+P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
" GitGutter
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
" enable powerline in airline status bar and make a cool tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" set airline theme
let g:airline_theme = 'base16'

" we only need one line for the command height....
:set cmdheight=1
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

" Open dirvish with dv
nnoremap dv :Dirvish<cr>
" jj to esc
inoremap jj <Esc>
" arrows don't move
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" when opening a file with scp, don't show pointless confirms
let g:netrw_silent=1

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" save file (make sure stty is off)
inoremap <c-s> <Esc>:update<CR>

" copy with ctrl+c
vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
" paste auto enters paste mode
imap <C-S-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>
" clear highlight with ctrl+l
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" select with mouse
set mouse=a
" faster reloading of my config
map <leader>e :e! ~/.vim/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim/my_configs.vim
