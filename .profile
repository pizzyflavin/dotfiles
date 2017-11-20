#==============================================================================
#
#                                    .profile
#
#==============================================================================

#==============================================================================
#  OS DETECTION
#==============================================================================

platform='unknown'
unamestr="$(uname)"

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='darwin'
fi

#==============================================================================
#  PATH SETTINGS
#==============================================================================

if [[ $platform == 'darwin' ]]; then

    # Add gnubin directory to path (macOS only)
    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

    # Add homebrew's python to path before system python (macOS only)
    PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

# Add ~/bin directory to path
PATH=$HOME/bin:$PATH

# Add ARM gcc to path
PATH=/usr/local/arm/gcc-arm-none-eabi-6-2017-q1-update/bin:$PATH

export PATH

#==============================================================================
#  MANPATH SETTINGS
#==============================================================================

if [[ $platform == 'darwin' ]]; then

    # Add gnuman directory to manpath (macOS only)
    MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
fi

export MANPATH

