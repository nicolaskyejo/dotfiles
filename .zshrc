# Aliases
alias c='clear'
alias x='exit'
alias l='ls -l' 
alias ll='ls -alh'
alias v='vim'
alias k='kubectl'
alias d='docker'
alias dk='docker-compose'
alias mkdir='mkdir -p'

# GIT
alias g='git'
alias s='git status'
alias r='git rebase -i HEAD~2'
alias flog='git log --follow -p -- '
alias slog='git log --pretty=oneline'
alias main='git checkout master'
alias branch='git branch --sort=-committerdate'
alias rm-branches='git branch | grep -v "master" | xargs git branch -D'
alias push-new-branch='git branch --show-current | xargs git push --set-upstream origin'

# Extra aliases
source $HOME/.vault_aliases

# Signing commits
export GPG_TTY=$(tty)
################################################################################

ZSH_DISABLE_COMPFIX=true
export ZSH="/home/nicolas/.oh-my-zsh"

ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=(
	"Soliah"
	"darkblood"
	"kolo"
	"philips"
)

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	docker
	docker-compose
	aws
	ssh-agent
)

source $ZSH/oh-my-zsh.sh
###############################################################################

export MYVIMRC="$HOME/.vimrc"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export PATH="/home/nicolas/bin/emojipick:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
