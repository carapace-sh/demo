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
               helix-grammars \
               neovim \
               htop \
               kakoune \
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
mkdir --parents ~/.config/elvish
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
