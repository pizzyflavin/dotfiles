#============================================================================#
# bashrc
#
# @author Ricky Rininger
#============================================================================#

#==============================================================================
#  OS DETECTION
#==============================================================================

platform='unknown'
unamestr="$(uname)"

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='darwin'
else
    echo "Unable to identify OS!"
    exit 1
fi

#============================================================================#
#  ENVIRONMENT SETUP
#============================================================================#
# Check for .bash_prompt
if [ -f "$HOME/.bash_prompt" ]; then
  source "$HOME/.bash_prompt"
fi

# Check for rust/cargo environment
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Check for git completion (first file found wins)
if [[ $platform == 'darwin' ]]; then
  git_completion_paths=()
  if command -v brew >/dev/null 2>&1; then
    git_completion_paths+=("$(brew --prefix)/etc/bash_completion.d/git-completion.bash")
  fi
  git_completion_paths+=(
    "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
    "$HOME/.git-completion.bash"
  )
else
  git_completion_paths=(
    "/usr/share/bash-completion/completions/git"                # Debian/Ubuntu/WSL git package
    "$HOME/.git-completion.bash"
  )
fi

for git_completion in "${git_completion_paths[@]}"; do
  if [ -f "$git_completion" ]; then
    source "$git_completion"
    break
  fi
done
unset git_completion git_completion_paths

export VISUAL=nvim

#============================================================================#
#  ALIASES AND FUNCTIONS
#============================================================================#

#-------------------------------------------------------------
# System Aliases
#-------------------------------------------------------------

if [[ $platform == 'darwin' ]]; then
  alias upd8='brew update && brew upgrade && brew cleanup'
else
  alias upd8='sudo apt update && sudo apt upgrade && \
              sudo apt autoremove --purge && sudo apt autoclean'
fi

alias vim='nvim'

#-------------------
# Personal Aliases
#-------------------

alias cp='cp -i'
alias mv='mv -i'     # -> Prevents accidentally clobbering files.
alias rm='rm -i'     # -> Prevents accidentally removing files.
alias grep='grep --color'

#-------------------------------------------------------------
# The 'ls' family
#-------------------------------------------------------------
# Add colors for filetype by default on 'ls':
alias ls='ls --color'

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -alhv"
alias l='ls -lhv'          #  Like ll, but don't show hidden files
alias lsd="ll -d */"       #  Only show directories

