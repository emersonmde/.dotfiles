autoload -U colors && colors
setopt prompt_subst

NCOLOR="%F{white}"
if [ $UID -eq 0 ]; then
  NCOLOR="%F{green}"
fi

git_prompt_info() {
  # Check if we're in a Git repo
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Get the current Git branch
    local branch="$(git branch --show-current 2>/dev/null)"
    # Check for uncommitted changes
    local changes=$(git status --porcelain)
    local STATUS_SYMBOL=""
    
    # Determine if there are changes and set the status symbol
    if [[ -n $changes ]]; then
      STATUS_SYMBOL="%F{red}✱%f"
    fi
    
    # Output the formatted Git branch and status symbol
    # Branch name in bold yellow, status symbol in red, all enclosed in grey parentheses
    echo "%F{grey}(%B%F{yellow}${branch}%b%f${STATUS_SYMBOL}%F{grey})%f"
  fi
}

PROMPT='[%B${NCOLOR}%n%b%{$reset_color%}:%F{red}%30<...<%~%<<%f]%(!.#.$) '
RPROMPT='$(git_prompt_info)'

# Color scheme from oh-my-zsh's mh theme
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00:32:*.voc=00;32:*.wav=00;32:'

# Aliases
alias vi="nvim"
alias cdws="cd ~/workspace"
alias lsa="ls -lah"

# ESP32
alias get_idf='. $HOME/esp/esp-idf/export.sh'

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Anaconda
export PATH=/opt/homebrew/anaconda3/bin:"$PATH"

# Mac Ports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# OpenSSL
export OPENSSL_DIR=/opt/homebrew/opt/openssl@3
export OPENSSL_STATIC=1

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 21`

# SdkMan for Gradle/Java
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
