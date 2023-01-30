# General ============================================
alias ls='ls -lh -A -G'

if [ -n "${CODESPACES}" ]; then
  alias vim='~/.local/bin/nvim'
else
  alias vim='nvim'
fi

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

alias ve='vim ~/.config/nvim/init.lua'

# Alias Editing
alias ae='vim ~/.zsh/aliases.zsh'    # alias edit
alias ar='source ~/.zsh/aliases.zsh' # alias reload

alias cdotf='cd /workspaces/.codespaces/.persistedshare/dotfiles'

alias gc='git commit'
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gbl='git branch -l'
alias gbd='git branch -D'
alias gg='git grep -n'
alias gco='git checkout'
alias gpo='git push origin'
alias glo='git pull origin'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gk='script/gack'
alias gsh='gh cs ssh -- -R 127.0.0.1:7391:$(rdm socket)'
alias gfu='git commit --amend --no-edit -a'
alias gdw='git rev-list -n 1 HEAD --'

# quickly resolve conflicts using vim
alias rc='vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )'

alias ta='tmux attach-session -t 0 || tmux'

alias bi='bundle install'
alias be='bundle exec'
alias mi='bundle exec rake db:migrate'

alias t='bin/rails test'

gh-cs-sync () {
  local codespace=$(gh cs list | awk '{print $1}' | fzf)
  local config=$(gh cs ssh -c $codespace --config)
  local hostname=$(echo $config | awk -v name=$codespace '$0 ~ "Host .*"name".*" {print $2}')
  echo $config > ~/.ssh/codespaces/$codespace
  mutagen sync create --name=$codespace $(pwd) $hostname:/workspaces/$(basename $(pwd))
}

gh-cs-stop-sync () {
  local codespace=$(gh cs list | awk '{print $1}' | fzf)

  rm ~/.ssh/codespaces/$codespace
  mutagen sync terminate $codespace
}
