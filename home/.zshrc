# Path to your oh-my-zsh installation.
export ZSH="/home/bader/.oh-my-zsh"
ZSH_DOTENV_FILE=.envrc
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bader/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/config/env.sh


# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    asdf
    git
#    kube-ps1
#    git-prompt
    dotenv
#    terraform
#    python
#    pip
#    nvm
    golang
    kubectl
    npm
    docker
    zsh-prompt-benchmark
    zsh_reload
)

source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source $HOME/.asdf/asdf.sh
source /home/bader/.cuddlefish/config

eval "$(starship init zsh)"

#eval $(ssh-agent) > /dev/null
#ssh-add ~/.ssh/id_rsa


set -o vi
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
if [[ -d ${HOME}/zshrc.d ]]; then
  while read dotd; do
    source "${dotd}"
  done < <(find ${HOME}/zshrc.d -follow -type f -not -name '*.disabled')
  unset dotd
fi

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || start-tmux
fi
