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

# Add gnubin directory to path (macOS only)
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Add ARM gcc to path
PATH=/usr/local/arm/gcc-arm-none-eabi-6-2017-q1-update/bin:$PATH

export PATH

#==============================================================================
#  MANPATH SETTINGS
#==============================================================================

# Add gnuman directory to manpath (macOS only)
MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

export MANPATH

