call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Plugins
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'chr4/nginx.vim'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'plasticboy/vim-markdown'

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
