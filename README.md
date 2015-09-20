# dotfiles
My scripts, installers and config files for Ubuntu Linux

Contents
--------

Detailed information about scripts and config files should be located in their file name or content.

- `config/` ~> location: `$HOME`
  - `.zshrc` ~> config for Z Shell
  - `.gitconfig` ~> config for Git
- `development/` ~> location: `$HOME/Development/`
  - `ui-config` ~> UI config files for JetBrains IDEs
  - `run-scripts`
    - `android/android-studio/bin/run-studio.sh`
    - `jvm/idea-ce/bin/run-idea.sh`
    - `python/pycharm-ce/bin/run-pycharm.sh`
- `install/` ~> should be used once after installing OS (please, read comments inside scripts)
  - `icons/spotify` ~> custom Spotify icons and instruction for replacing them with existing ones
  - `install-stuff.sh`
  - `prepare-windows-manager.sh`
- `usr/local/bin` ~> location: `/usr/local/bin`
  - [`git-cheat`](https://github.com/0xAX/git-cheat) ~> git cheat sheets in your command line
  - [`pidcat`](https://github.com/JakeWharton/pidcat) ~> improved LogCat for Android
  - `prettyjson` ~> script, which prints pretty json - e.g. `echo '{"foo": "bar"}' | pretty-json`
  - [`screenfetch`](https://github.com/KittyKatt/screenFetch/) ~> displays system info & its ASCII logo
  - `smplayer` ~> downloads music stream with `wget` to a file and plays it with `mplayer`
  - `start-dmenu` ~> my keyboard shortcut for [dmenu](http://tools.suckless.org/dmenu/) is `Super+``
  - `switch-java` ~> allows to switch Java version
  - `mux-4tiles` ~> creates 4 tiles (2 rows, 2 columns) in `tmux`

Directory structure for projects
--------------------------------

- `$HOME/Development/`
   - android
     - android-studio
     - android-sdk
     - android-projects
   - jvm
     - jvm-projects
     - idea-ce
   - python
     - pycharm-ce
     - python-projects
   - *any other language or technology...*
     - *-projects
     - ...

Other
-----

My keyboard shortcut for terminal is `Ctrl+``. Remaining shortcuts are default.

If you're interested in configuration of my Gnome Classic desktop environment, you can check this article: http://blog.wittchen.biz.pl/gnome-classic-desktop-environment-on-ubuntu/
