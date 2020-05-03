#===============================================================================
# Tmux
#===============================================================================
# if [ -z "$TMUX" ]
# then
    # tmux attach -t TMUX || tmux new -s TMUX
# fi


#===============================================================================
# Powerlevel10k - Instant prompt
#===============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#===============================================================================
# Exports
#===============================================================================
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# You may need to manually set your language environment
export LANG=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export VISUAL='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
#   export VISUAL='nvim' 
# else
#   export EDITOR='nvim'
#   export VISUAL='nvim' 
# fi

export TERM=xterm-256color

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# java
#export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# android
export ANDROID_HOME=/Users/f.lopezyuste/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="$HOME/.fastlane/bin:$PATH"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# python3.7
export PATH="/Users/f.lopezyuste/Library/Python/3.7/bin:$PATH"

# python2.7
export PATH="/Users/f.lopezyuste/Library/Python/2.7/bin:$PATH"

# node10
export PATH="/usr/local/opt/node/bin:$PATH"
# export PATH="/usr/local/opt/node@10/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


#===============================================================================
# Aliases
#===============================================================================
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# alias sslyze
alias 'sslyze'='docker run --rm -it nablac0d3/sslyze'

# alias vim
alias 'vim'='nvim'
alias 'lvim'='\vim'

# alias exit
alias ':q'='exit'


#===============================================================================
# ZSH
#===============================================================================
# Path to your oh-my-zsh installation.
export ZSH="/Users/f.lopezyuste/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


#===============================================================================
# ZSH - Plugins
#===============================================================================
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  adb
  ansible
  git
  brew
  common-aliases
  git-extras
  git-flow
  gradle
  ng
  node
  npm
  sudo
  sublime
  docker
  aws
  mvn
  kubectl
  kubetail
  kops
  helm
  minikube
  pip
  vagrant
  vagrant-prompt
  vscode
  zsh-syntax-highlighting
  history-substring-search
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


#===============================================================================
# Powerlevel10k
#===============================================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#===============================================================================
# iTerm2
#===============================================================================
# iTerm2 - iterm2_shell_integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

iterm2_print_user_vars() {
    it2git
}


#===============================================================================
# exa
#===============================================================================
# alias exa
alias ls='exa --group-directories-first --classify'
alias l='exa --group-directories-first --classify'
alias la='exa -al --group-directories-first --classify'
alias ll='exa -l --group-directories-first --classify'
alias lt='exa -l -s=modified --group-directories-first --classify'
alias lta='exa -al -s=modified --group-directories-first --classify'
alias lrt='exa -l -s=modified -r --group-directories-first --classify'
alias lrta='exa -al -s=modified -r --group-directories-first --classify'

# alias lla='exa -al --group-directories-first --classify'
# alias lal='exa -al --group-directories-first --classify'
# alias lt='exa -T --group-directories-first --classify'
# alias lta='exa -aT --group-directories-first --classify'
# alias lat='exa -aT --group-directories-first --classify'


#===============================================================================

