# turn off beep
unsetopt BEEP
# init a new node project quickly
function node-project {
  git init
  npx license $(npm get init.license) -o "$(npm get init.author.name)" > LICENSE
  npx gitignore node
  npx covgen "$(npm get init.author.email)"
  npm init -y
  git add -A
  git commit -m "Initial commit"
}

# deletes all screenshots on your desktop
alias deleteScreenshots="find ~/Desktop -maxdepth 1 -name '*Screen*' -delete"

function precmd() {
  if (($COLUMNS < 100))
    then 
      POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode)
      SPACESHIP_RPROMPT_ORDER=(
        time
        vi_mode       # Vi-mode indicator
      )

  else 
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode history battery ip)
    SPACESHIP_RPROMPT_ORDER=(
      time
      vi_mode       # Vi-mode indicator
    )
  fi
}

# do NOT show right prompt after executing command
setopt TRANSIENT_RPROMPT

# Auto CD
setopt auto_cd

alias vim="nvim"
# If you come from bash you might have to change your $PATH.
export PATH=~/.okta/bin:$HOME/bin:/usr/local/bin:$PATH

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi

if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

# custom scripts added here below:
# export PATH=$PATH:~/bin

# Path to your oh-my-zsh installation.
export ZSH=/Users/moroark/.oh-my-zsh

# POWERLINE settings
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
# SPACESHIP settings
#SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_NODE_DEFAULT_VERSION=8.11.4
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_GIT_STATUS_COLOR=yellow
SPACESHIP_RPROMPT_ORDER=(
  time
  vi_mode       # Vi-mode indicator
)

# this makes vi mode work correctly for spaceship prompt
export RPS1="%{$reset_color%}"

# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode history battery ip)	
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powershell9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  dotenv
  battery
)

source $ZSH/oh-my-zsh.sh

# User configuration

# activate vim mode for the command line
set -o vi
bindkey -v
# acivate ctrl-R for searching backwards through command history
bindkey '^R' history-incremental-search-backward

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# source /Users/moroark/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
