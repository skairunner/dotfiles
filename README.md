# dotfile Setup

    sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
    sudo apt-get update
    sudo apt-get install rcm
    git clone https://github.com/skairunner/dotfiles ~/.dotfiles
    rcup

# Vim Setup

    git clone https://github.com/k-takata/minpac.git \
        ~/.vim/pack/minpac/opt/minpac
    vim
    :PackUpdate
