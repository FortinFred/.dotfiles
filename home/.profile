# aliases
alias lv='NVIM_APPNAME=lazyvim nvim'


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

 
# GitHub CLI
export PATH="/home/fred/tools/gh/bin:/home/fred/tools/gh/bin:/home/fred/.local/bin:/home/fred/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/home/fred/.dotnet/tools:/home/fred/tools/lazygit:/opt/nvim-linux-x86_64/bin:/home/fred/tools/lazygit:/opt/nvim-linux-x86_64/bin"


# Lazygit
export PATH=$PATH:$HOME/tools/lazygit


# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

