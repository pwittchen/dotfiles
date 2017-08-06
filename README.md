dotfiles
========
my dotfiles for Linux and macOS

installation
------------

```shell
git clone git@github.com:pwittchen/dotfiles.git
cd dotfiles && ./install.sh
```

**note**: commands above won't install plugin managers & plugins

update
------

```shell
cd dotfiles
git pull && ./install.sh
```

plugins
-------
- **tmux**
  - plugin manager: [tpm](https://github.com/tmux-plugins/tpm)
  - plugins:
    - [tmux-sidebar](https://github.com/tmux-plugins/tmux-sidebar)
    - [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)
    - [tmux-pain-control](https://github.com/tmux-plugins/tmux-pain-control)
    - [tmux-urlview](https://github.com/tmux-plugins/tmux-urlview)
    - [tmux-plugin-battery](https://github.com/pwittchen/tmux-plugin-battery)
- **vim**
  - plugin manager: [vim-pathogen](https://github.com/tpope/vim-pathogen)
  - plugins:
    - [nerdtree](https://github.com/scrooloose/nerdtree)
    - [tagbar](https://github.com/majutsushi/tagbar)
    - [ctrlp](https://github.com/kien/ctrlp.vim)
