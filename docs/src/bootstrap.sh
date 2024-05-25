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

# elvish
mkdir --parents ~/.config
echo "\
set paths = [ ~/.local/bin ~/go/bin \$@paths ]


set-env CARAPACE_MATCH 1
set edit:completion:matcher[argument] = {|seed| edit:match-prefix \$seed &ignore-case=\$true }

set-env CARAPACE_BRIDGES zsh,fish,bash
eval (carapace _carapace|slurp)

unset-env STARSHIP_SHELL
set-env STARSHIP_SHELL elvish
set-env SHELL elvish
set-env EDITOR hx
set edit:prompt = { starship prompt }
set E:LS_COLORS = (vivid generate dracula)

set edit:rprompt = { echo '' }
" > ~/.config/elvish/rc.elv

