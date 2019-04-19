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
colo base16-material

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

" comment with ,cc and uncomment with ,cu 
" See https://gist.github.com/Bad-ptr/c880141ad3a68e4e4bc0/218e249f4c3f24efcaacf3eca037e77145993bf9#file-vimrc-L249 
noremap ,cc :<C-B>silent <C-E>s/\V\.\*/\=
            \printf(&commentstring,getline("."))/<CR>
            \:nohlsearch<CR>
noremap ,cu :<C-B>silent <C-E>s/\V\^<C-R>=
            \escape(get(split(&commentstring,'%s'),0,''),'\/').'\\|'.
            \escape(get(split(&commentstring,'%s'),1,''),'\/')
\<CR>\$//g<CR>:nohlsearch<CR>

" save file (make sure stty is off)
inoremap <c-s> <Esc>:update<CR>

" copy with ctrl+c
vnoremap <C-c> :w !xclip -selection clipboard -i<CR>
" paste auto enters paste mode
noremap <C-v> :set paste<CR>:r!xclip -selection clipboard -o<Esc>:set nopaste<CR>
" clear highlight with ctrl+l
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" select with mouse
set mouse=a
" faster reloading of my config
map <leader>e :e! ~/.vim/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim/my_configs.vim

let g:syntastic_check_on_open = 0
