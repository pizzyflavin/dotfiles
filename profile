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
else
    echo "Unable to identify OS!"
    exit 1
fi

#==============================================================================
#  PATH SETTINGS
#==============================================================================

if [[ $platform == 'linux' ]]; then

    # Do Linux stuff
    echo ""

elif [[ $platform == 'darwin' ]]; then

    # Add homebrew sbin to path
    BREW_SBIN="/usr/local/sbin"
    PATH="$BREW_SBIN:$PATH"

    # Add gnubin directory to path (macOS only)
    BREW_COREUTILS_PATH="$(brew --prefix coreutils)/libexec/gnubin"
    PATH="$BREW_COREUTILS_PATH:$PATH"

    # Add gnugrep directory to path (macOS only)
    BREW_GREP_PATH="$(brew --prefix grep)/libexec/gnubin"
    PATH="$BREW_GREP_PATH:$PATH"

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

export PATH

#==============================================================================
#  MANPATH SETTINGS
#==============================================================================

if [[ $platform == 'linux' ]]; then

    # Do Linux stuff
    echo ""

elif [[ $platform == 'darwin' ]]; then

    # Add gnuman directory to manpath (macOS only)
    BREW_COREUTILS_MANPATH="$(brew --prefix coreutils)/libexec/gnuman"
    MANPATH="$BREW_COREUTILS_MANPATH:$MANPATH"
fi

export MANPATH

