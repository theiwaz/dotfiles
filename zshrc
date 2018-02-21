export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ryan/git-tf:/usr/local/share/dotnet:/Library/TeX/texbin"
export PATH="$HOME/.fastlane/bin:$PATH"
source $ZSH/oh-my-zsh.sh

# Path to your oh-my-zsh installation.
export ZSH=/Users/ryan/.oh-my-zsh

autoload colors zsh/terminfo
colors

# Autostart TMUX
if [ "$TMUX" = "" ]; then tmux; fi

# Faster response on keys
export KEYTIMEOUT=1

# stop typing cd space
setopt auto_cd

# spelling correction
setopt correctall
alias git status='nocorrect git status'

# ZSH plugin manager Antigen
if [[ ! -f ~/.antigen.zsh ]]; then
  #curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
  curl -L git.io/antigen > ~/antigen.zsh
fi
ANTIGEN_MUTEX=false
source ~/.antigen.zsh

# plugins=(git npm node brew z sublime npm docker)
# Antigen plugins 
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle git-prompt
antigen bundle docker
antigen bundle brew


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# DocFx Aliases
alias docfx="mono ~/Library/docfx/docfx.exe build"
alias docfx-meta="mono ~/Library/docfx/docfx.exe metadata"
alias docfx-serve="mono ~/Library/docfx/docfx.exe serve _site"

[ -s "/Users/ryan/.dnx/dnvm/dnvm.sh" ] && . "/Users/ryan/.dnx/dnvm/dnvm.sh" # Load dnvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Iterm2 support
source ~/.iterm2_shell_integration.`basename $SHELL`

# Docker cli completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Pygments color coding output
alias pcat='pygmentize -f terminal256 -O style=native -g'

# bindkeys VIM mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# bindkeys Autosuggest
bindkey '^ ' autosuggest-accept
bindkey '^`' autosuggest-toggle


# VI Mode with cursor indication

function zle-line-init zle-keymap-select {
	# Prompt
	precmd() { print "" }
	#VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	PS1="%{$fg_bold[yellow]%}$(git_super_status) %{$reset_color%}⟩"
	RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%} ${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	    zle reset-prompt
    }

zle -N zle-line-init
zle -N zle-keymap-select

