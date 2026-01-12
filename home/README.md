# Requirements

- Zsh is installed

# Installation
- Set zsh as the default shell: `chsh -s $(which zsh)`
- Install sutff:
```sh
# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s`

# Install zsh-autocomplete plugin
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.local/share/zsh/zsh-autocomplete

# Install zsh-autosuggestions plugin
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.local/share/zsh/zsh-autosuggestions

# Install zsh-syntax-highlighting plugin
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/zsh/zsh-syntax-highlighting
```
