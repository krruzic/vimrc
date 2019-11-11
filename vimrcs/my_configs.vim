" set up colorscheme
let base16colorspace=256
colo nord
" jj to esc
inoremap jj <Esc>
" arrows don't move
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" comment with ,cc and uncomment with ,cu
" See https://gist.github.com/Bad-ptr/c880141ad3a68e4e4bc0/218e249f4c3f24efcaacf3eca037e77145993bf9#file-vimrc-L249
noremap ,cc :<C-B>silent <C-E>s/\V\.\*/\=
            \printf(&commentstring,getline("."))/<CR>
            \:nohlsearch<CR>
noremap ,cu :<C-B>silent <C-E>s/\V\^<C-R>=
            \escape(get(split(&commentstring,'%s'),0,''),'\/').'\\|'.
            \escape(get(split(&commentstring,'%s'),1,''),'\/')
\<CR>\$//g<CR>:nohlsearch<CR>

" CTRL+S save file (make sure stty is off)
inoremap <c-s> <Esc>:update<CR>

" set autochdir and disable auto-vim-rooter
set autochdir

" define a command which runs ripgrep in the root directory
" as determined by rooter
command! -bang -nargs=+ -complete=dir Rg
    \ call fzf#vim#ag_raw(<q-args> . ' ' . (system('git status') =~ '^fatal'
    \ ? expand("%:p:h") : system("git rev-parse --show-toplevel")),
    \ fzf#vim#with_preview(), <bang>0)
" yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
" copy with ctrl+c
vnoremap <C-c> :w !xclip -selection clipboard -i<CR><CR>
" paste auto enters paste mode
noremap <C-v> :set paste<CR>:r!xclip -selection clipboard -o<Esc>:set nopaste<CR>
:nnoremap q <c-v>
" select with mouse
set mouse=a
" open this config file
map <leader>e :e! ~/.vim/vimrcs/my_configs.vim<cr>
" automatically resource on save
autocmd! bufwritepost vimrc source ~/.vim/vimrcs/my_configs.vim
" faster file loading
let g:syntastic_check_on_open = 0

" Set up MRU
let MRU_Max_Entries = 200
" GitGutter
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>
" enable powerline in airline status bar and make a cool tabline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
" airline settings
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_c = airline#section#create(['%F'])
let g:airline_section_x = airline#section#create_right(['bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
let g:airline_section_y = airline#section#create_right([''])
" ctrl+P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlPMixed'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 6
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
" ripgrep search like ctrlP
nnoremap <C-g> :Rg<Cr>

" Open dirvish with dv
nnoremap dv :Dirvish<cr>
" set up language server shit
let g:coc_node_path = '/home/krruzic/.nvm/versions/node/v13.1.0/bin/node'
let g:python3_host_prog = "/home/krruzic/.pyenv/versions/neovim/bin/python3"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_global_extensions = ['coc-snippets', 'coc-rls', 'coc-python', 'coc-tsserver', 'coc-vetur', 'coc-html']
let g:coc_snippet_next = '<tab>'
let g:vista_default_executive = 'coc'
