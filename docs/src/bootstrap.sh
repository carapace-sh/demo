#!/bin/sh

pkg update -y

pkg install -y bat \
               elvish \
               eza \
               fish \
               git \
               gh \
               golang \
               gopls \
               gum \
               helix \
               htop \
               python \
               ripgrep \
               starship \
               tig \
               vivid \
               which \
               wget \
               zsh

pip install httpie \
            xonsh


# starship
mkdir --parents ~/.config
echo "\
add_newline = false

[shell]
disabled = false
" > ~/.config/starship.toml
