# Install docker-ce

# If in WSL
if grep -q microsoft /proc/version; then

    sudo apt-get update
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo gpasswd -a $USER docker


    # Install docker compose
    # Finds the latest version
    $ switch_version=$(curl -fsSL -o /dev/null -w "%{url_effective}" https://github.com/docker/compose-switch/releases/latest | xargs basename)

    # Downloads the binary
    $ sudo curl -fL -o /usr/local/bin/docker-compose \
        "https://github.com/docker/compose-switch/releases/download/${switch_version}/docker-compose-linux-$(dpkg --print-architecture)"

    # Assigns execution permission to it
    $ sudo chmod +x /usr/local/bin/docker-compose

fi