#============================================================================#
# bashrc
#
# @author Ricky Rininger
#============================================================================#

# Check for .bash_prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi


#============================================================================#
#  ENVIRONMENT SETUP
#============================================================================#
export VISUAL=nvim

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#============================================================================#
#  ALIASES AND FUNCTIONS
#============================================================================#

#-------------------------------------------------------------
# System Aliases
#-------------------------------------------------------------
alias upd8='sudo apt update && sudo apt upgrade && \
            sudo apt autoremove --purge && sudo apt autoclean'

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

