cd ~/.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
echo 'set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.vim/colors
set runtimepath+=~/.vim/ftplugin
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/plugins_config.vim

try
source ~/.vim/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
