# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


function cd {
    builtin cd "$@" && ls --color
    }

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)  
bindkey '^n' autosuggest-accept 
setopt PROMPT_SUBST
# Note the single quotes
RPS1='${MODE_INDICATOR_PROMPT} ${vcs_info_msg_0_}'
source $ZSH/oh-my-zsh.sh


alias bu='sudo dnf update'
alias ..="cd .."
alias ...="cd ../.."
alias j="cd ~/Downloads"
alias g="cd ~/GitClones"
alias p="python3"
alias t="cd ~/thesis"
alias va='cd ~/vasco'
alias i="cd ~/ist"
alias c='code .'
alias n='nautilus .'
alias d='dolphin .'
alias tr='cd ~/thesis/transformer && source ~/.zshrc-anaconda && conda activate orbem'
alias gck='git checkout'
alias gc='git clone'
alias v='nvim .'
alias vi='nvim'
alias vim='nvim'
alias anaconda='source ~/zshrc-anaconda'
alias d='cd ~/vasco/dotfiles'

