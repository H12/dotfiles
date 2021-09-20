# Add homebrew binaries to path
set PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Add ~/.local/bin to path
set PATH /Users/henryfirth/.local/bin $PATH

# Add llvm binaries to path
set PATH (brew --prefix llvm)/bin $PATH

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
