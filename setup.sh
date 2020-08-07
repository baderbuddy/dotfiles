cd ~
git clone https://github.com/gpakosz/.tmux.git
mkdir tmux-plugins
cd tmux-plugins
git clone git@github.com:baderbuddy/kube-tmux.git
cd ..
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s .tmux/.tmux.conf
ln -s dotfiles/tmux.conf.local .tmux.conf.local
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/p10k.zsh .p10k.zsh
mkdir config
touch config/env.sh
touch config/mfa.txt
touch config/gitconfig
