#!/usr/bin/env bash

curl -sL 'https://packages.microsoft.com/keys/microsoft.asc' | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" -O /tmp/packages-microsoft-prod.deb
echo "deb https://packages.microsoft.com/repos/azure-cli/ $dist main" > /etc/apt/sources.list.d/azure.list
dpkg -i /tmp/packages-microsoft-prod.deb

apt-get update
apt-get install -fy azure-cli dotnet-sdk-*

apt-get remove -fy packages-microsoft-prod
