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

