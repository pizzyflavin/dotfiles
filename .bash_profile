##############################################################################
# .bash_profile
#
# @author Ricky Rininger
# @email pizzyflavin@gmail.com
#
##############################################################################

# Check for .profile file
if [ -f ~/.profile ]; then
  source ~/.profile
fi

# Check for .bashrc file
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Check for git-completion file
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
