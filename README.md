# system

```sh
$ sudo apt install direnv neovim tmux zsh
```

# dotfiles

```sh
$ curl -sSfL https://git.io/chezmoi | sh -s -- -b ~/.local/bin
$ ~/.local/bin/chezmoi init https://github.com/skairunner/dotfiles
```
# neovim

```sh
$ git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac
$ nvim
:PackUpdate
```

# pyenv

```sh
$ curl -sSfL https://pyenv.run | bash
```

# zsh

```sh
$ git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.local/share/oh-my-zsh"
$ chsh -s "$(which zsh)"
$ exec zsh -l
```
