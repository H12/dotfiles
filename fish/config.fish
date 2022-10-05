# Add homebrew binaries to path
set PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Add ~/.local/bin to path
set PATH /Users/henryfirth/.local/bin $PATH

# Add llvm binaries to path
set PATH (brew --prefix llvm)/bin $PATH

# Add flutter binaries to path
set PATH /Users/henryfirth/code/flutter/bin $PATH

# Set EDITOR and VISUAL
set -gx EDITOR nvim
set -gx VISUAL nvim

# Make iex terminal remember history
set -gx ERL_AFLAGS "-kernel shell_history enabled"

# Set up asdf-vm
source ~/.asdf/asdf.fish

# Make python point to python3
alias python "python3"

# Extra git aliases
alias gpo "gh pr checkout"
alias gpu "git push -u && gh pr create --web"

# Add tldr function
function tldr
  curl -s cht.sh/$argv | less -R
end

# Set up peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# Bind CTRL+e to editor
bind \co edit_command_buffer

# Fuck
thefuck --alias | source

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467c
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
