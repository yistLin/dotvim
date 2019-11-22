# VIM/NVIM Configuration

The goal of this repo is to synchronize my configuration of VIM/NVIM across all platforms.

### Setup

First please refer to [vim-plug](https://github.com/junegunn/vim-plug) for the installation of vim-plug.
Then clone this repo to your **$HOME** directory with the following command:

~~~bash
git clone https://github.com/yistLin/vimconfig.git $HOME/.vim
~~~

And put the following lines into your vimrc:

~~~bash
set nocompatible

source $HOME/.vim/vimrcs/plugin.vim
source $HOME/.vim/vimrcs/general.vim
source $HOME/.vim/vimrcs/rendering.vim
source $HOME/.vim/vimrcs/filetype.vim
source $HOME/.vim/vimrcs/interface.vim
source $HOME/.vim/vimrcs/mapping.vim
~~~

Since I'm using **vim-plug** as plug-in manager, don't forget to run `:PlugInstall` while starting VIM/NVIM.

### References

- [How to show italic in vim in iTerm2](https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2)
- [VIM Auto Completion Plug-in: deoplete](https://developpaper.com/vim-auto-completion-plug-in-deoplete/)
