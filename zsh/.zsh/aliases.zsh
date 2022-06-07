# General ============================================
alias ls='ls -lh -A -G'
alias vim='nvim'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

alias ve='vim ~/.config/nvim/init.vim'

# Alias Editing
alias ae='vim ~/.zsh/aliases.zsh'    # alias edit
alias ar='source ~/.zsh/aliases.zsh' # alias reload

alias cdotf='cd /workspaces/.codespaces/.persistedshare/dotfiles'

alias gc='git commit'
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gd='git diff'
alias gg='git grep -n'
alias gco='git checkout'
alias gpo='git push origin'
alias glo='git pull origin'
alias gri='git rebase --interactive'
alias gra='git rebase --abort'
alias gk='script/gack'
alias gsh='gh cs ssh'

# quickly resolve conflicts using vim
alias rc='vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )'

alias bi='bundle install'
alias be='bundle exec'

alias t='bin/rails test'
