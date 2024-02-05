# system

```sh
$ sudo apt install direnv fd-find fzf neovim tmux zsh
$ ssh-keygen
```


On Mac:
```sh
$ brew install direnv fd fzf neovim tmux zsh
$ ssh-keygen
```

# dotfiles

```sh
$ curl -sSfL https://git.io/chezmoi | sh -s -- -b ~/.local/bin
$ ~/.local/bin/chezmoi init --apply https://github.com/skairunner/dotfiles
```
# neovim

```sh
$ git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac
$ nvim
:PackUpdate
```

# poetry
```sh
$ curl -sSfL https://raw.githubusercontent.com/python-poetry/poetry/develop/get-poetry.py | python3 - --no-modify-path
```

# pyenv

```sh
$ curl -sSfL https://pyenv.run | bash
$ pyenv global [default version]
```

# zsh

```sh
$ git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.local/share/oh-my-zsh"
$ chsh -s "$(which zsh)"
$ exec zsh -l
```
