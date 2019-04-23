call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Default Plugins
NeoBundle 'chriskempson/base16-vim', '938242'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'yegappan/mru'
NeoBundle 'ctrlpvim/ctrlp.vim/'
call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Set up MRU
let MRU_Max_Entries = 200
map <leader>f :MRU<CR>
" GitGutter
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>
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
" ctrl+P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
" Open dirvish with dv
nnoremap dv :Dirvish<cr>

