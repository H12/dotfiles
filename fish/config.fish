# Add ~/.local/bin to path
set PATH ~/.local/bin $PATH

# Add homebrew binaries to path
set PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Add cargo binaries to path
set PATH ~/.cargo/bin $PATH

# Add bob binaries to path
set PATH ~/.local/share/bob/nvim-bin $PATH

# Add mason binaries to path
set PATH ~/.local/share/nvim/mason/bin $PATH

# Set EDITOR and VISUAL
set -gx EDITOR nvim
set -gx VISUAL nvim

# Bind CTRL+e to editor
bind \co edit_command_buffer

# CLI Tool Replacement Aliases
alias ls "exa"

# Activate rtx
if type -q rtx
	rtx activate fish | source
else
	echo "rtx not found"
end

# Initialize starship prompt
if type -q starship
	starship init fish | source
else
	echo "starship not found"
end
