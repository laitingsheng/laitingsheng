#!/usr/bin/env bash

curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | apt-key add -
echo "deb https://download.docker.com/linux/ubuntu ${dist} stable" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -fy docker-ce

version=$(curl -fLs https://api.github.com/repos/docker/machine/releases/latest | grep 'tag_name' | cut -d '"' -f 4)
wget -O /usr/local/bin/docker-machine "https://github.com/docker/machine/releases/download/${version}/docker-machine-Linux-x86_64"
chmod 755 /usr/local/bin/docker-machine

SCRIPTS=(docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash)
parallel -d ' ' -j 200% "wget -O /etc/bash_completion.d/{} https://raw.githubusercontent.com/docker/machine/${version}/contrib/completion/bash/{} && chmod 644 /etc/bash_completion.d/{}" ::: ${SCRIPTS[@]}
