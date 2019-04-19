" only modify lines between #begin and #end
call neobundle#begin(expand('~/.vim/bundle'))

" Add your plugins here
NeoBundle 'chr4/nginx.vim'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'moll/vim-node'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'hdima/python-syntax'
NeoBundle 'etdev/vim-hexcolor'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
