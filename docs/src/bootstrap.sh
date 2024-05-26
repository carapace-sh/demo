#!/bin/sh

yes | pkg update

yes | pkg install bat \
                  elvish \
                  eza \
                  fish \
                  git \
                  gh \
                  golang \
                  gopls \
                  gum \
                  helix \
                  helix-grammars \
                  neovim \
                  htop \
                  kakoune \
                  nushell \
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

# .profile
echo "\
export EDITOR=hx
export LS_COLORS=\"\$(vivid generate dracula)\"
export PATH=\"/data/data/com.termux/files/home/.local/bin:/data/data/com.termux/files/home/go/bin:\$PATH\"

export CARAPACE_MATCH=1
export CARAPACE_BRIDGES='bash,zsh,fish'
" > ~/.profile

# bash
echo "\
source ~/.profile

export SHELL=bash
export STARSHIP_SHELL=bash

eval \"\$(starship init bash)\"

source <(carapace _carapace bash)
" > ~/.bashrc

# elvish
mkdir --parents ~/.config/elvish
echo "\
set-env SHELL elvish
set-env STARSHIP_SHELL elvish

set edit:prompt = { starship prompt }
set edit:rprompt = { echo '' }

set edit:completion:matcher[argument] = {|seed| edit:match-prefix \$seed &ignore-case=\$true }
eval (carapace _carapace elvish|slurp)
" > ~/.config/elvish/rc.elv


# xonsh
mkdir --parents ~/.config/xonsh
echo "\
$SHELL='xonsh'
$STARSHIP_SHELL='xonsh'

$PROMPT=lambda: \$(starship prompt)
$COMPLETIONS_CONFIRM='True'
$COMPLETION_QUERY_LIMIT=500
del aliases['ls']

exec(\$(carapace _carapace xonsh))
" > ~/.config/xonsh/rc.xsh

# zsh
# shellcheck disable=SC2028
echo "\
export SHELL=zsh
export STARSHIP_SHELL=zsh

autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' format \$'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

eval \"\$(starship init zsh)\"

source <(carapace _carapace zsh)
" > ~/.zshrc

# helix
mkdir --parents ~/.config/helix
echo "\
theme = \"catppuccin_mocha\"

[editor]
bufferline = \"multiple\"
line-number = \"relative\"
mouse = false

[keys.normal]
\"h\" = \"collapse_selection\"
\"j\" = \"move_char_left\"
\"k\" = \"move_line_down\"
\"l\" = \"move_line_up\"
\";\" = \"move_char_right\"

\"g\" = { h = \"no_op\", j = \"goto_line_start\", l = \"no_op\", \";\" = \"goto_line_end\" }
\"A-'\" = \"flip_selections\"

\"A-Q\" = \"wclose\"
\"A-w\" = \"rotate_view\"
\"A-h\" = \"hsplit\"
\"A-v\" = \"vsplit\"

\"A-j\" = \"jump_view_left\"
\"A-k\" = \"jump_view_down\"
\"A-l\" = \"jump_view_up\"
\"A-;\" = \"jump_view_right\"

\"A-J\" = \"swap_view_left\"
\"A-K\" = \"swap_view_down\"
\"A-L\" = \"swap_view_up\"
\"A-:\" = \"swap_view_right\"

[keys.select]
\"h\" = \"collapse_selection\"
\"j\" = \"extend_char_left\"
\"k\" = \"extend_line_down\"
\"l\" = \"extend_line_up\"
\";\" = \"extend_char_right\"

\"g\" = { h = \"no_op\", j = \"goto_line_start\", l = \"no_op\", \";\" = \"goto_line_end\" }

\"A-'\" = \"flip_selections\"

\"A-Q\" = \"wclose\"
\"A-w\" = \"rotate_view\"
\"A-h\" = \"hsplit\"
\"A-v\" = \"vsplit\"

\"A-j\" = \"jump_view_left\"
\"A-k\" = \"jump_view_down\"
\"A-l\" = \"jump_view_up\"
\"A-;\" = \"jump_view_right\"

[keys.normal.space]
\"y\" = \":clipboard-yank-join\" # Join and yank selections to clipboard

[keys.select.space]
\"y\" = \":clipboard-yank-join\" # Join and yank selections to clipboard
" > ~/.config/helix/config.toml


# example specs
mkdir --parents ~/.config/carapace/specs
echo "\
# yaml-language-server: \$schema=https://carapace.sh/schemas/command.json
name: ls
run: \"[eza]\"
" > ~/.config/carapace/specs/ls.yaml
