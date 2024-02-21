if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Added by Toolbox App
export PATH="$PATH:/Users/matthew/Library/Application Support/JetBrains/Toolbox/scripts"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Anaconda
export PATH=/opt/homebrew/anaconda3/bin:"$PATH"

# Mac Ports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"
