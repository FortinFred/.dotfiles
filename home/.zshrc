if [ -f ~/.profile ]; then
    source ~/.profile
fi   

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fred/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.local/share/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

eval "$(oh-my-posh init zsh)"

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi   
