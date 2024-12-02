#!/bin/bash

setupSymlink $(pwd)/.bashrc $HOME/.bashrc
setupSymlink $(pwd)/.zshrc $HOME/.zshrc
setupSymlink $(pwd)/.p10k.zsh $HOME/.p10k.zsh

installZsh() {
  # if dnf command is available
  if command -v dnf &>/dev/null; then
    sudo dnf install -y zsh
  elif command -v apt &>/dev/null; then
    sudo apt install -y zsh
  fi
  chsh -s /usr/bin/zsh
}

installOhMyZsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended "" --keep-zshrc

  rm -rf $HOME/.oh-my-zsh/custom/
  #plugins
  git -c http.sslVerify=false clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git -c http.sslVerify=false clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  #powerlevel10k
  git -c http.sslVerify=false clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

installZsh
installOhMyZsh

dotfilesRC '
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
'
