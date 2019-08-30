# VIM/NVIM Configuration

The goal of this repo is to synchronize my configuration of VIM/NVIM across all platforms.

### Setup

First please refer to [vim-plug](https://github.com/junegunn/vim-plug) for the installation of vim-plug.
Then clone this repo to wherever you like.
After cloing simply create soft links to these files.

#### Vim

~~~bash
ln -s <path_to_this_repo>/vimrc  $HOME/.vimrc
ln -s <path_to_this_repo>/dotvim $HOME/.vim
~~~

#### Neovim

~~~bash
ln -s <path_to_this_repo>/vimrc    $HOME/.config/nvim/init.vim
ln -s <path_to_this_repo>/dotvim/* $HOME/.config/nvim/
~~~

Since I'm using **vim-plug** as plug-in manager, don't forget to run `:PlugInstall` while starting VIM/NVIM.

### References

- [How to show italic in vim in iTerm2](https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2)
- [VIM Auto Completion Plug-in: deoplete](https://developpaper.com/vim-auto-completion-plug-in-deoplete/)
