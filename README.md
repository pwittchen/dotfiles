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

to generate empty config template files, in `~/.config/scripts` dir, type:

```
./install.sh config
```

you can restore old configs (in case you had it previously) by typing:

```
./install.sh restoreconfig
```

sometimes, argos scripts and tmux plugins may need additional adjustments on several computers

work
----

on my computer at work, I don't need several scripts and stuff and to run work installation, we can type:

```shell
./install.sh work
```

argos
-----

my argos scripts don't work the same on all computers, so they're exluded from the main install procedure

to install them explicitly, we need to invoke the following command:

```
./install.sh argos
```

after installations, scripts may require adjustments

plugins
-------
- **tmux**
  - plugin manager: [tpm](https://github.com/tmux-plugins/tpm)
  - plugins:
    - [tmux-plugin-battery](https://github.com/pwittchen/tmux-plugin-battery)
    - [tmux-plugin-uptime](https://github.com/pwittchen/tmux-plugin-uptime)
    - [tmux-plugin-cpu](https://github.com/pwittchen/tmux-plugin-cpu)
    - [tmux-plugin-ram](https://github.com/pwittchen/tmux-plugin-ram)
- **vim**
  - plugin manager: [vim-pathogen](https://github.com/tpope/vim-pathogen)
  - plugins:
    - [nerdtree](https://github.com/scrooloose/nerdtree)
    - [tagbar](https://github.com/majutsushi/tagbar)
    - [ctrlp](https://github.com/kien/ctrlp.vim)
    - [supertab](https://github.com/ervandew/supertab)
    - [auto-pairs](https://github.com/jiangmiao/auto-pairs)

themes and terminal emulators
-----------------------------

[Theme](https://github.com/robbyrussell/oh-my-zsh/wiki/themes) I usually use for oh-my-zsh is:
- [agnoster](https://github.com/robbyrussell/oh-my-zsh/wiki/themes#agnoster)
  - color scheme I currently use: [nord](https://arcticicestudio.github.io/nord/) ([Tilix](https://github.com/arcticicestudio/nord-tilix), [iTerm2](https://github.com/arcticicestudio/nord-iterm2))
  - font for macOS: `12 pt Meslo LG M DZ Regular for Powerline` can be found in [powerline/fonts](https://github.com/powerline/fonts) repository
  - font for Linux: [Menlo for PowerLine](https://github.com/abertsch/Menlo-for-Powerline)

Terminal emulators I usually use:
- [Tilix](https://gnunn1.github.io/tilix-web/) on Linux
   - color schemes for Tilix on Linux: https://github.com/storm119/Tilix-Themes
 - [iTerm2](https://www.iterm2.com/) on macOS
   - color schemes for iTerm2 on macOS: https://github.com/mbadolato/iTerm2-Color-Schemes
