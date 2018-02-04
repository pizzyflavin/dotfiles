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
    BREW_COREUTILS_PATH="$(brew --prefix coreutils)/libexec/gnubin"
    PATH="$BREW_COREUTILS_PATH:$PATH"

    # Add homebrew's python to path before system python (macOS only)
    BREW_PYTHON_PATH="/usr/local/opt/python/libexec/bin"
    PATH="$BREW_PYTHON_PATH:$PATH"

    # Add Qt to path
    QT_PATH="/usr/local/opt/qt/bin"
    PATH="$QT_PATH:$PATH"
fi

# Add ~/bin directory to path
HOME_BIN="$HOME/bin"
PATH="$HOME_BIN:$PATH"

# Add ARM gcc to path
ARM_GCC_PATH="$HOME/tools/EmbeddedArm/gcc-arm-none-eabi-7-2017-q4-major/bin"
PATH="$ARM_GCC_PATH:$PATH"

OPENOCD_PATH="$HOME/tools/EmbeddedArm/openocd-bin/bin"
PATH="$OPENOCD_PATH:$PATH"

export PATH

#==============================================================================
#  MANPATH SETTINGS
#==============================================================================

if [[ $platform == 'darwin' ]]; then

    # Add gnuman directory to manpath (macOS only)
    MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
fi

export MANPATH

