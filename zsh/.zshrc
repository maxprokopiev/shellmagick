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

source ~/.zsh/aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
