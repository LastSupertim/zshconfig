#!/bin/sh

ROOT=$( cd "$( dirname "$0" )" && pwd )

mkdir -p ~/.config/zsh/backup

# Backup existing zshell scripts
if [[ -f ~/.zshrc ]]; then
	mv ~/.zshrc ~/.config/zsh/backup/
fi

if hash curl 2>/dev/null; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
elif hash wget 2>/dev/null; then
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

ln -f $ROOT/data/.zsh* ~/

zsh
