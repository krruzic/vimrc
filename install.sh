cd ~/.vim
echo '
set runtimepath+=~/.vim/colors
try
source ~/.vim/vimrcs/plugins.vim
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/my_configs.vim
catch
endtry' > ~/.config/nvim/init.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
