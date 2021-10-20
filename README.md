# .zsh
My ZSH configuration

## Prerequisites

- [age](https://age-encryption.org/)
- [git](https://git-scm.com/)
- [zplug](https://zplug.github.io/)

## How to Install

Clone the repository

```sh
git clone git@github.com:akarzim/.zsh.git ~/git/zsh
```

Then link the dotfiles

```sh
cd ~
ln -s ~/git/zsh/zshenv ~/.zshenv
ln -s ~/git/zsh/zshrc ~/.zshrc
ln -s ~/git/zsh/zprofile ~/.zprofile
ln -s ~/git/zsh/zlogin ~/.zlogin
ln -s ~/git/zsh/zlogout ~/.zlogout
ln -s ~/git/zsh/zplug-packages.zsh ~/.zplug/packages.zsh
```
