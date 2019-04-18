cd ~/.vim_runtime
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
echo 'set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/.vim_runtime
set runtimepath+=~/.vim_runtime/colors
set runtimepath+=~/.vim_runtime/ftplugin
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
