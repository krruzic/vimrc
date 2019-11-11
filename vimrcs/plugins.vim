let dein_readme=expand('~/.cache/dein/repos/github.com/Shougo/dein.vim/README.md')

if !filereadable(dein_readme)
  echo "Installing Dein..."
  echo ""
  silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.cache/dein_installer.sh
  silent !sh ~/.cache/dein_installer.sh ~/.cache/dein
endif

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
        " required:
        call dein#add('~/.cache/dein/repos/github.com/shougo/dein.vim')
        call dein#add('chriskempson/base16-vim', { 'rev': '938242', } )
        call dein#add('vim-airline/vim-airline')
        call dein#add('vim-airline/vim-airline-themes')
        call dein#add('justinmk/vim-dirvish')
        call dein#add('airblade/vim-gitgutter')
        call dein#add('yegappan/mru')
        call dein#add('ctrlpvim/ctrlp.vim')

        call dein#add('chr4/nginx.vim')
        call dein#add('rust-lang/rust.vim')
        call dein#add('moll/vim-node')
        call dein#add('plasticboy/vim-markdown')
        call dein#add('hdima/python-syntax')
        call dein#add('etdev/vim-hexcolor')
        call dein#add('arcticicestudio/nord-vim')
        call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
        call dein#add('liuchengxu/vim-clap')
        call dein#add('liuchengxu/vista.vim')
    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

