
autoload colors zsh/terminfo
colors

precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

setopt auto_cd

setopt correctall
alias git status='nocorrect git status'
alias vim='nvim'
export NVM_DIR="/Users/moroark/.nvm"

export NVM_DIR="/Users/moroark/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
