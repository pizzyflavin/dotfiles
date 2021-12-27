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

#=============================================================================
# Embedded Development Stuff
#=============================================================================
# Set EMBEDDED_DEV to false to disable
EMBEDDED_DEV=true
if [ "$EMBEDDED_DEV" = true ]; then

    # Get possible installed version of arm gcc
    INSTALLED_ARM_GCC=$(command -v arm-none-eabi-gcc)

    # Get possible embedded tools version of arm gcc
    EMBEDDED_TOOLS_ARM_GCC=$(find $HOME/tools/EmbeddedArm -maxdepth 1 -type d \
                             -name "gcc-arm-none-eabi-*")

    # Is Arm GCC already in the path?
    if [ -x "$INSTALLED_ARM_GCC" ]; then
        echo "* Arm GNU Toolchain is already installed in $INSTALLED_ARM_GCC"
        echo "  To use another version, use absolute path"

    # If not, is it in embedded tools?
    elif [ -d "$EMBEDDED_TOOLS_ARM_GCC" ]; then
        # Add this ARM gcc to path
        ARM_GCC_PATH="$EMBEDDED_TOOLS_ARM_GCC/bin"
        PATH="$ARM_GCC_PATH:$PATH"
        echo "* Arm GNU Toolchain from $EMBEDDED_TOOLS_ARM_GCC added to path"

    # Then it is not installed
    else
        echo "* Arm GNU Toolchain is not installed. Please download and install"
    fi

    # Get possible installed version of OpenOCD
    INSTALLED_OPENOCD=$(command -v openocd)

    # Get possible embedded tools version of OpenOCD
    EMBEDDED_TOOLS_OPENOCD=$(find $HOME/tools/EmbeddedArm -maxdepth 1 -type d \
                             -name "openocd-*")

    # Is OpenOCD already in the path?
    if [ -x "$INSTALLED_OPENOCD" ]; then
        echo "* OpenOCD is already installed in $INSTALLED_OPENOCD"
        echo "  To use another version, use absolute path"

    # If not, is it in embedded tools?
    elif [ -d "$EMBEDDED_TOOLS_OPENOCD" ]; then
        # Add this OpenOCD to path
        OPENOCD_PATH="$EMBEDDED_TOOLS_OPENOCD/bin"
        PATH="$OPENOCD_PATH:$PATH"
        echo "* OpenOCD from $EMBEDDED_TOOLS_OPEN_OCD added to path"

    # Then it is not installed
    else
        echo "* OpenOCD is not installed. Please download and install"
    fi

fi # EMBEDDED_DEV

export PATH

#==============================================================================
#  MANPATH SETTINGS
#==============================================================================

if [[ $platform == 'darwin' ]]; then

    # Add gnuman directory to manpath (macOS only)
    BREW_COREUTILS_MANPATH="$(brew --prefix coreutils)/libexec/gnuman"
    MANPATH="$BREW_COREUTILS_MANPATH:$MANPATH"
fi

export MANPATH

