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

# Set default options for FZF
set -gx FZF_DEFAULT_OPTS --color=bw

# Make iex terminal remember history
set -gx ERL_AFLAGS "-kernel shell_history enabled"

# Set up asdf-vm
source ~/.asdf/asdf.fish

# Make python point to python3
alias python "python3"

# Git aliases
alias gst "git status"
alias ga "git add"
alias gc "git commit"
alias gc! "git commit --amend"
alias gca "git commit --all"
alias gca! "git commit --all --amend"
alias gd "git diff"
alias glg "git log"
alias gco "git checkout"
alias grs "git reset"
alias grss "git reset --staged"
alias gpo "gh pr checkout"
alias gpu "git push -u && gh pr create --web"

# Helpful directory aliases
alias ... "../.."
alias .... "../../.."
alias ..... "../../../.."

# Add tldr function
function tldr
  curl -s cht.sh/$argv | less -R
end

# Bind CTRL+e to editor
bind \co edit_command_buffer

# Fuck
thefuck --alias | source
