#!/usr/bin/env bash

source general.bash

install -o root -g root -m 644 ubuntu.sources.list.template /etc/apt/sources.list
sed -i "s|%REPO%|http://au.archive.ubuntu.com/ubuntu|g;s/%DIST%/${dist}/g" /etc/apt/sources.list
apt-get update
apt list --installed | cut -d '/' -f1 | xargs apt-mark auto
xargs apt-get install -fy <<- EOL
ubuntu-minimal
ubuntu-standard
ubuntu-server
ubuntu-gnome-desktop
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
errno
parallel
expect
tree
p7zip-full
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
language-pack-gnome-zh-hans
language-pack-gnome-zh-hant
intel-mkl-full
nvidia-cuda-toolkit-gcc
EOL
