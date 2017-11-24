let base16colorspace=256

set term=xterm-256color
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
syntax on
set number
set cursorline
set t_ut=
colo base16-material

" set up colorscheme
hi CursorLine gui=underline guifg=NONE guibg=NONE
hi LineNr guifg=grey 
hi CursorLineNr guifg=orange 
" enable powerline in airline status bar and make a cool tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
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

" comment with ,cc and uncomment with ,cu 
" See https://gist.github.com/Bad-ptr/c880141ad3a68e4e4bc0/218e249f4c3f24efcaacf3eca037e77145993bf9#file-vimrc-L249 
noremap ,cc :<C-B>silent <C-E>s/\V\.\*/\=
            \printf(&commentstring,getline("."))/<CR>
            \:nohlsearch<CR>
noremap ,cu :<C-B>silent <C-E>s/\V\^<C-R>=
            \escape(get(split(&commentstring,'%s'),0,''),'\/').'\\|'.
            \escape(get(split(&commentstring,'%s'),1,''),'\/')
            \<CR>\$//g<CR>:nohlsearch<CR>
" paste toggle with F2...
set pastetoggle=<F2>

