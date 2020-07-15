#!/usr/bin/env bash

source general.bash

install -o root -g root -m 644 ubuntu.sources.list.template /etc/apt/sources.list
sed -i "s|%REPO%|http://au.archive.ubuntu.com/ubuntu|g;s/%DIST%/${dist}/g" /etc/apt/sources.list
apt-get update
apt-get purge -fy lxd lxd-client snapd
apt list --installed | cut -d '/' -f1 | xargs apt-mark auto
xargs apt-get install -fy <<- EOL
ubuntu-minimal
ubuntu-standard
ubuntu-server
build-essential
cmake-extras
meson
gcc-opt
gdc
gcovr
git-all
git-ftp
git-lfs
subversion
ruby-all-dev
wsl
errno
parallel
expect
tree
p7zip
python3-all-dbg
python3-pip
gradle
maven
libboost-all-dev
openjdk-8-jdk
openjdk-11-jdk
haskell-platform
haskell-stack
valgrind-dbg
mono-complete
lldb
llvm-dev
ldc
clang
clang-format
clang-tidy
clang-tools
clangd
texlive
texlive-full
gccgo
golang
gnugo
nodejs
npm
julia
locales-all
language-pack-zh-hans
language-pack-zh-hant
intel-mkl-full
EOL

install -o root -g root -m 644 wsl.conf /etc/wsl.conf
apt-get install -fy ubuntu-wsl
