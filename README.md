dotfiles
========
my dotfiles used on Linux and macOS

installation and update
-----------------------

### configuration

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/pwittchen/dotfiles/master/scripts/updateDotfiles)"
```

Once we installed configuration, after reloading shell, we can simply type `updateDotfilesRemote` to be up to date.

### scripts

```
git clone git@github.com:pwittchen/dotfiles.git
cd scripts
sudo cp * /usr/local/bin/
```

### git for work

I use different e-mail address in `.gitconfig` for work and command below can be used to set it up.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/pwittchen/dotfiles/master/scripts/updateGitForWork)"
```

To revert setup of git for work and bring back personal git setup, we can use `updateDotfilesRemote` command.
