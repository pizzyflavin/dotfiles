#==============================================================================
#
#                                    .profile
#
#==============================================================================

#==============================================================================
#  OS DETECTION
#==============================================================================

unamestr="$(uname -a)"
platform='unknown'
is_wsl='false'

if [[ "$unamestr" == *'Linux'* ]]; then
    platform='linux'
    if [[ "$unamestr" == *'microsoft'* ]]; then
        is_wsl='true'
    fi
elif [[ "$unamestr" == *'Darwin'* ]]; then
    platform='darwin'
else
    echo "Unable to identify OS!"
    exit 1
fi

#==============================================================================
#  PATH SETTINGS
#==============================================================================

if [[ $platform == 'linux' ]]; then

    echo "OS: Linux"

    # Add arm-none-eabi-gcc embedded tools to path
    ARM_GCC_PATH="$HOME/tools/gcc-arm-none-eabi/bin"
    PATH="$PATH:$ARM_GCC_PATH"

    # WSL-specific
    if [[ "$is_wsl" == 'true' ]]; then
        echo "Loading Microsoft WSL Configuration"

        # CMake bin dir for downloaded binary
        PATH="$PATH:$HOME/tools/cmake-3.24.0-linux-x86_64/bin"

        # Alias for gdb debugging
        alias debug='cmd.exe /c start wsl.exe ~/tools/openocd/bin/openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "init" -c "halt" -c "reset halt" & arm-none-eabi-gdb-py --eval-command="target remote localhost:3333"'
    fi

    echo ""

elif [[ $platform == 'darwin' ]]; then

    echo "OS: Darwin"
    echo ""
    #
    # Add arm-none-eabi-gcc embedded tools to path
    ARM_GCC_PATH="$HOME/tools/gcc-arm-none-eabi/bin"
    PATH="$PATH:$ARM_GCC_PATH"

    # Add docker to path
    DOCKER_PATH="/Applications/Docker.app/Contents/Resources/bin"
    PATH="$PATH:$DOCKER_PATH"

    # Add homebrew sbin to path
    BREW_SBIN="/usr/local/sbin"
    PATH="$PATH:$BREW_SBIN"

    # Add gnubin directory to path (macOS only)
    BREW_COREUTILS_PATH="$(brew --prefix coreutils)/libexec/gnubin"
    PATH="$PATH:$BREW_COREUTILS_PATH"

    # Add gnugrep directory to path (macOS only)
    BREW_GREP_PATH="$(brew --prefix grep)/libexec/gnubin"
    PATH="$PATH:$BREW_GREP_PATH"

    # Add homebrew's python to path before system python (macOS only)
    BREW_PYTHON_PATH="/usr/local/opt/python/libexec/bin"
    PATH="$PATH:$BREW_PYTHON_PATH"

    # Add Qt to path
    QT_PATH="/usr/local/opt/qt/bin"
    PATH="$PATH:$QT_PATH"
fi

# Check for bin dir for local pip installations
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi

# Add ~/bin directory to path
HOME_BIN="$HOME/bin"
PATH="$PATH:$HOME_BIN"

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
    MANPATH="$MANPATH:$BREW_COREUTILS_MANPATH"
fi

export MANPATH

