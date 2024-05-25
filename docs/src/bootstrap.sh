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
