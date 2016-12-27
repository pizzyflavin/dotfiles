#==============================================================================
#
#                                    .profile
#
#==============================================================================

#==============================================================================
#  PATH SETTINGS
#==============================================================================

# Add ~/bin directory to path
PATH=$HOME/bin:$PATH

# Add gnubin directory to path
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

export PATH

#==============================================================================
#  MANPATH SETTINGS
#==============================================================================

# Add gnuman directory to manpath
MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

export MANPATH

