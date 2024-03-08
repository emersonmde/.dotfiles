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
    echo "%F{grey}(%B%F{green}${branch}%b%f${STATUS_SYMBOL}%F{grey})%f"
  fi
}

#PROMPT='[%B${NCOLOR}%n%b%{$reset_color%}:%F{red}%30<...<%~%<<%f]%(!.#.$) '
PROMPT='[%B${NCOLOR}%n%b%{$reset_color%}:%F{blue}%m:%F{green}%30<...<%~%<<%f]%(!.#.$) '
RPROMPT='$(git_prompt_info)'
os_type="$(uname -s)"

# # Color scheme from oh-my-zsh's mh theme (Mac)
# if [[ "$os_type" == "Darwin" ]]; then
#   export LSCOLORS="Gxfxcxdxbxegedabagacad"
#   alias ls="ls -G"
# fi
#
# # Color scheme from oh-my-zsh's mh theme (Linux)
# if [[ "$os_type" == "Linux" ]]; then
#   # Set LS_COLORS for GNU `ls`
#   export LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.bat=01;32:*.dll=01;32:*.tar=01;31:*.tgz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
#   alias ls="ls --color=auto"
# fi

# Aliases
alias vi="nvim"
alias cdws="cd ~/workspace"
alias ls="ls --color=auto"
alias lsa="ls -lah"

# ZSH completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

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
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 21`
fi

# SdkMan for Gradle/Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# iTerm2 Shell Integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY

# Other program defaults
export SYSTEMD_EDITOR=nvim
export BROWSER=firefox

if [ -f ~/.zshrc-work ]; then
  source ~/.zshrc-work
fi

# Fix history search in tmux
bindkey '^R' history-incremental-search-backward

# Fix ls colors
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  export LSCOLORS=gxfxcxdxbxegedabagacad
else
  # Linux
  export LS_COLORS='di=32:'
fi
