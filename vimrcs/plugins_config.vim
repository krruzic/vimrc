call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Plugins
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
