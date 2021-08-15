# Add homebrew binaries to path
set PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Set EDITOR and VISUAL
set EDITOR nvim
set VISUAL nvim

# Set up asdf-vm
source ~/.asdf/asdf.fish

# Make python point to python3
alias python=python3

# Add tldr function
function tldr
	curl -s cht.sh/$argv | less -R
end

# Bind CTRL+e to editor
bind \ce edit_command_buffer
