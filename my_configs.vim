if (has("termguicolors"))
     set termguicolors
endif

set term=xterm-256color
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
syntax on
set number
set cursorline
set t_ut=
colo base16-tomorrow-night

" set up colorscheme
hi CursorLine ctermbg=NONE
hi LineNr ctermfg=grey 
hi CursorLineNr ctermfg=red ctermbg=black

" enable powerline in airline status bar and make a cool tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" set airline theme
let g:airline_theme = 'base16_tomorrow'
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
let g:netrw_silent=1

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

inoremap <c-s> <Esc>:update<CR>
