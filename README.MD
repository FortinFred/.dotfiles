# Install
```sh
git config --global user.name "Frédéric Fortin"
git config --global user.email "17817939+FortinFred@users.noreply.github.com"
git config --global credential.helper "/mnt/c/Program\ Files\ \(x86\)/Git\ Credential\ Manager/git-credential-manager.exe"

cd ~
git clone https://github.com/FortinFred/dotfiles.git .dotfiles

cd .dotfiles
. ./bootstrap.sh
```
# WSL2 Fonts

Next we will install the Meslo Nerd Font pack (recommended for PowerLevel10k zsh theme). This is done by downloading the [MesloLGS NF Regular.ttf](https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf) font and clicking on the Install


Then change WSL configuration to use that font.

**settings.json**
```json
            {
                "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
                "hidden": false,
                "name": "Ubuntu-20.04",
                "source": "Windows.Terminal.Wsl",
                "font": // Add this
                    {
                        "face": "MesloLGS NF"
                    }, 
            }
```
