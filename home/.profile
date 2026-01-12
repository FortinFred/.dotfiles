# aliases
alias lv='NVIM_APPNAME=lazyvim nvim'


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

 
# GitHub CLI
export PATH="$HOME/tools/gh/bin:$HOME/tools/gh/bin:$HOME/.local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:$HOME/.dotnet/tools:$HOME/tools/lazygit:/opt/nvim-linux-x86_64/bin:$HOME/tools/lazygit:/opt/nvim-linux-x86_64/bin"


# Lazygit
export PATH=$PATH:$HOME/tools/lazygit


# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# npm
export PATH=$PATH:$HOME/.npm-global/bin

# oh-my-posh
export PATH=$PATH:/home/fred/.local/bin
