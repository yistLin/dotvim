# VIM Configuration

The goal of this repo is to synchronize my configuration of VIM across all platforms.

### Setup

First, you need to clone Vundle.vim by initializing and updating the submodules.
Run the following command in the root directory of the repo.

~~~bash
git submodule init && git submodule update
~~~

Then go into `dotvim/bundle/Vundle.vim` and checkout to master branch so that Vundle can handle its update by itself.

~~~bash
cd dotvim/bundle/Vundle.vim && git checkout master
~~~

And create soft links to these files.

~~~bash
ln -s <path_to_this_repo>/vimrc  $HOME/.vimrc
ln -s <path_to_this_repo>/dotvim $HOME/.vim
~~~

Since I'm using [Vundle](https://github.com/VundleVim/Vundle.vim) as plug-in manager, don't forget to run `:PluginInstall` while starting VIM.

### References

- [How to show italic in vim in iTerm2](https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2)
- [VIM Auto Completion Plug-in: deoplete](https://developpaper.com/vim-auto-completion-plug-in-deoplete/)
