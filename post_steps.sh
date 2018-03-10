#!/bin/bash

# preparation
username=finxxi

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/${username}/.fzf
/home/${username}/.fzf/install

# for java8
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y

# font Consolas
sudo apt-get install font-manager cabextract -y
set -e
set -x
wget -q http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab
mkdir ${home_path}/.fonts
mv CONSOL* ${home_path}/.fonts
fc-cache -f -v

# enable new keybinding for fzf
fish
set -U FZF_LEGACY_KEYBINDINGS 0

# fish post_actions
fisher fzf
fisher fnm
fnm 8
npm install sfdx-cli --global