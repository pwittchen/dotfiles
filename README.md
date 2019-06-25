dotfiles
========
my dotfiles for Linux and macOS

installation
------------

```shell
git clone git@github.com:pwittchen/dotfiles.git
cd dotfiles && ./install.sh
```

**note**: commands above won't install plugin managers, plugins and config for scripts

update
------

```shell
cd dotfiles
git pull && ./install.sh
```

config
------

config for the scripts located in `.scripts` and `.argos` dirs have to be performed manually because this repo doesn't contain sensitive data like passwords, api keys, etc.; right now configs are used by `.scripts/functions/personal.sh` script adn backup scripts and configuration is kept in `~/.config/scripts/personal.conf` and `~/.config/scripts/ftp_server.conf` files in the system (not available in this repo)

work
----

at work I don't need several scripts and to remove them after running `./install.sh`, type:

```shell
./work_post_install.sh
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
    - [tmux-plugin-uptime](https://github.com/pwittchen/tmux-plugin-uptime)
    - [tmux-plugin-cpu](https://github.com/pwittchen/tmux-plugin-cpu)
    - [tmux-plugin-ram](https://github.com/pwittchen/tmux-plugin-ram)
    - [tmux-plugin-ip](https://github.com/pwittchen/tmux-plugin-ip)
    - [tmux-plugin-spotify](https://github.com/pwittchen/tmux-plugin-spotify)
- **vim**
  - plugin manager: [vim-pathogen](https://github.com/tpope/vim-pathogen)
  - plugins:
    - [nerdtree](https://github.com/scrooloose/nerdtree)
    - [tagbar](https://github.com/majutsushi/tagbar)
    - [ctrlp](https://github.com/kien/ctrlp.vim)
    - [supertab](https://github.com/ervandew/supertab)
    - [auto-pairs](https://github.com/jiangmiao/auto-pairs)
    - [javap-vim](https://github.com/udalov/javap-vim)
    - [vim-jdb](https://github.com/Dica-Developer/vim-jdb)

themes and terminal emulators
-----------------------------

[Theme](https://github.com/robbyrussell/oh-my-zsh/wiki/themes) I usually use for oh-my-zsh is:
- [agnoster](https://github.com/robbyrussell/oh-my-zsh/wiki/themes#agnoster)
  - color scheme I currently use: [nord](https://arcticicestudio.github.io/nord/) ([Tilix](https://github.com/arcticicestudio/nord-tilix), [iTerm2](https://github.com/arcticicestudio/nord-iterm2))
  - font for macOS: `12 pt Meslo LG M DZ Regular for Powerline` can be found in [powerline/fonts](https://github.com/powerline/fonts) repository
  - font for Linux: [Menlo for PowerLine](https://github.com/abertsch/Menlo-for-Powerline)

Terminal emulators I use:
- [Tilix](https://gnunn1.github.io/tilix-web/) on Linux
   - color schemes for Tilix on Linux: https://github.com/storm119/Tilix-Themes
 - [iTerm2](https://www.iterm2.com/) on macOS
   - color schemes for iTerm2 on macOS: https://github.com/mbadolato/iTerm2-Color-Schemes
