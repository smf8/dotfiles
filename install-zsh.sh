#!/bin/bash

sudo apt update

if ! sudo apt install -y curl fzf terminator zsh; then
    echo "install dependencies failed"
    exit 1
fi

if ! sudo chsh -s "$(which zsh)"; then
  echo "failed to change default shell"
  exit 1
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


echo "installing plugins"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "installing p10k"

git clone https://github.com/romkatv/powerlevel10k-media.git /tmp/p10km

sudo cp /tmp/p10km/*.ttf /usr/local/share/fonts/

fc-cache -f -v

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "done :) copy zshrc file then run p10k configure"
#p10k configure
