# dotfiles (Mac OS X)
my scripts, installers and config files for Mac OS X

Installing required software
----------------------------

**Homebrew**

```shell
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

When Homebrew is installed, we can use it to install software as follows:

```shell
$ brew install wget
```

**Zsh and oh-my-zsh**

```shell
$ brew install zsh zsh-completions
$ chsh -s /bin/zsh # set zsh as default shell
$ curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

**Ant, Maven, Gradle**

```shell
$ brew install ant maven gradle
```

**JDK**

- [JDK 7 download website](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
- [JDK 8 download website](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [JDK 9 download website](https://jdk9.java.net/download/)
