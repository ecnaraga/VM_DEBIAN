#!/bin/sh

# Installation de l interface graphique
sudo su
apt-get update
apt-get install task-gnome-desktop -y

# Create a user + sudo rights
useradd -m -p $2 $1
# To force user to change his passwd at first connexion
passwd -e $1
# To give sudo rigths
usermod -aG sudo $1

apt-get update && apt-get upgrade

# Git
apt-get install git -y
# git config --global user.email "mymail.@example.com"
# git config --global user.email "myname"

# SSH
# ssh-keygen -t rsa -f /home/$USERNAME/.ssh

# Make
apt-get install make -y

# Install wget and gpg
apt-get install wget gpg -y

# Vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
apt-get install apt-transport-https
apt-get update
apt-get install code

# Vagrant
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get install vagrant -y

# # Nasm (Pour compiler asm intel syntax)
# apt-get install nasm

# # Package necessaire pour lancer QEMU + GRUB
# apt-get install gcc-multilib -y
# apt-get install qemu-system -y
# apt-get install qemu-system-i386 -y
# apt-get install  xorriso -y
# apt-get install mtools -y
# apt-get install git -y
# apt-get install grub-pc-bin -y

reboot