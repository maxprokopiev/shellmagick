fpath=(~/.zsh $fpath)

# initialize the prompt system
autoload -U promptinit && promptinit

# choose the right prompt
prompt pure

# don't beep
setopt NO_BEEP

# auto cd without typing cd (useful for '..' things)
setopt AUTO_CD

export EDITOR=vim

# =========== COMPLETION ===========

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

# for autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# =========== ALIASES ===========

source ~/.zsh/aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
