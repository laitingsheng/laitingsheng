#!/usr/bin/env bash

curl -s 'https://packages.cloud.google.com/apt/doc/apt-key.gpg' | apt-key add -
echo 'deb https://apt.kubernetes.io kubernetes-xenial main' > /etc/apt/sources.list.d/google.list
echo 'deb http://packages.cloud.google.com/apt cloud-sdk main' >> /etc/apt/sources.list.d/google.list

apt-get update
apt-get install kubeadm google-cloud-sdk

kubectl completion bash > /etc/bash_completion.d/kubectl

wget -O /usr/local/bin/skaffold 'https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64'
chmod 755 /usr/local/bin/skaffold
