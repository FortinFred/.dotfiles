ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc

#.Oh-My-Zsh
sudo apt update
sudo apt install git zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended "" --keep-zshrc
chsh -s /usr/bin/zsh

#powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
