# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel10k/powerlevel10k"
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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#    kube-ps1
#    git-prompt
    dotenv
#    terraform
#    python
#    pip
#    nvm
    npm
    docker
    zsh-prompt-benchmark
    zsh_reload
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#setopt PROMPT_SUBST ;
#PRETTY_DIR='$(print -D -P $PWD|grep --color=always -e "^" -e "[~]/")'
# precmd() {
#  eval "LEFT=\"${PRETTY_DIR}\""
#  RIGHT="$(kube_ps1)"
 
#  local zero='%([BSUbfksu]|([FK]|)|($reset_color)|($KUBE_PS1_COLOR_SYMBOL)|($KUBE_PS1_COLOR_CONTEXT)|(%{.*%})|(%)|({)|(}){*})'
#  RIGHTLENGTH=${(S%%)RIGHT//$~zero/}
#  RIGHT="${RIGHT//{}"
#  RIGHT="${RIGHT//\}}"
#  RIGHT="${RIGHT//\%}"
#  RIGHTWIDTH=$(($COLUMNS-${#LEFT}+20+${#RIGHTLENGTH}-${#RIGHT}))
#  print $LEFT${(l:$RIGHTWIDTH:: :)RIGHT}
#}
#PROMPT='%(!.%F{red}.%F{cyan})%n%f@%F{green}%m%f%F{red}\$%f '

#LS_COLORS=di=01;34:ln=01;36:pi=40;33:so=01;35:d0=01;35:bd=40
#LSCOLORS

source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(starship init zsh)"


alias dotenv=". ./.env"
alias k="kubectl"
alias mfa="oathtool --base32 --totp \"$(cat ~/config/mfa.txt)\""
alias loginFW="KUBECONFIG=\"$HOME/.kube/config-fw\" aws-vault exec ro-identity zsh"
alias loginFWMfa="mfa | loginFW"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /home/bader/.cuddlefish/config
source $HOME/.asdf/asdf.sh

function maybe_git_fetch () {
  if ! [ -d ".git" ]; then
    return
  fi
  last_fetch=$(stat -c %Y .git/FETCH_HEAD)
  time_now=$(date +%s)
  timeout=60
  if [[ $((time_now - timeout)) -gt $((last_fetch)) ]]; then
    (git fetch 2> /dev/null &)
  fi
}

#eval $(ssh-agent) > /dev/null
#ssh-add ~/.ssh/id_rsa
alias kw='watch kubectl'
OLDKUBECONFIG="BAD"
precmd () {
  if (( ${+TMUX} )); then
    envVar="$(tmux display-message -p 'KUBECONFIG_#S_#P_#I')"
#    if [ "$KUBECONFIG" != "$OLDKUBECONFIG" ] || [ "$envVar" != "$oldEnvVar" ]; then
      OLDKUBECONFIG=$KUBECONFIG
      oldEnvVar=$envVar
      tmux setenv $(tmux display-message -p 'KUBECONFIG_#S_#P_#I') "$KUBECONFIG"
#    fi
  fi
  maybe_git_fetch
}

start-tmux() {
    tmux new-session -t default \; neww \; split-window -v \; split-window -h \; previous-window \; attach
}

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || start-tmux
fi

create-kind() {
kind delete cluster

reg_name='kind-registry'
reg_port='5000'

    cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
containerdConfigPatches:
- |-
  [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:${reg_port}"]
    endpoint = ["http://${reg_name}:${reg_port}"]
EOF

kubectl create ns metrics-server
helm upgrade --install metrics bitnami/metrics-server --namespace metrics-server --set apiService.create=true --set extraArgs.kubelet-insecure-tls=true --set extraArgs.kubelet-preferred-address-types=InternalIP --set extraArgs.metric-resolution=30s
kubectl create ns prometheus
helm upgrade --install prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.enabled=false --set kubeStateMetrics.enable=false --set nodeExporter.enabled=false
running="$(docker inspect -f '{{.State.Running}}' "${reg_name}" 2>/dev/null || true)"
if [ "${running}" != 'true' ]; then
      docker run \
              -d --restart=always -p "${reg_port}:5000" --name "${reg_name}" \
              --network container:kind-control-plane \
    registry:2
  fi

# tell https://tilt.dev to use the registry
# https://docs.tilt.dev/choosing_clusters.html#discovering-the-registry
for node in $(kind get nodes); do
  kubectl annotate node "${node}" "kind.x-k8s.io/registry=localhost:${reg_port}";
done

}

