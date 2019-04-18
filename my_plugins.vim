NeoBundleFetch 'chriskempson/base16-vim'
NeoBundleFetch 'ctrlpvim/ctrlp.vim'
NeoBundleFetch 'chr4/nginx.vim'
NeoBundleFetch 'rust-lang/rust.vim'
NeoBundleFetch 'vim-airline/vim-airline'
NeoBundleFetch 'vim-airline/vim-airline-themes'
NeoBundleFetch 'justinmk/vim-dirvish'
NeoBundleFetch 'airblade/vim-gitgutter'
NeoBundleFetch 'plasticboy/vim-markdown'

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""""""""""

" MRU
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
