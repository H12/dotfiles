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
alias python=python3

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

thefuck --alias | source
