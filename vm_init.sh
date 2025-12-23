#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# GRAPHIC INTALLATION
sudo su
apt-get update
apt-get install task-gnome-desktop -y

# Crypte le password
PASS=$(openssl passwd -6 $2)
# Create a user + sudo rights
useradd -m -p $PASS $1
# # To force user to change his passwd at first connexion
# passwd -e $1
# # To give sudo rigths
# usermod -aG sudo $1

apt-get update && apt-get upgrade

# # SSH
# echo "*************SSH************"
# # Create and manage owner and rights on .ssh directory
# mkdir -p /home/$1/.ssh
# chown -R $1:$1 /home/$1/.ssh
# chmod 700 /home/$1/.ssh
# # Generate ssh key
# ssh-keygen -t rsa -b 4096 -C $4 -f /home/$1/.ssh/id_rsa -N ""
# # Manage owner and rights on id_rsa files
# chown -R $1:$1 /home/$1/.ssh/id_rsa
# chown -R $1:$1 /home/$1/.ssh/id_rsa.pub
# chmod 600 /home/$1/.ssh/id_rsa
# chmod 644 /home/$1/.ssh/id_rsa.pub
# # ssh-add /home/$1/.ssh/id_rsa

# Git"
echo "GIT"
apt-get install git -y
# # GIT CLI INSTALLATION
# apt-get install gh
# # # Authentificate to github account through classic token
# echo $3 > token.txt
# gh auth login --with-token < token.txt
# # # Adding ssh_key to github account
# gh ssh-key add /home/$1/.ssh/id_rsa.pub --title "IOT"
# # # To be able to add, commit, push => config avec l utilisateur
# sudo -u $1 git config --global user.email "$4"
# sudo -u $1 git config --global user.name "$5"
# rm token.txt

# To force user to change his passwd at first connexion
passwd -e $1
# To give sudo rigths
usermod -aG sudo $1

# # Make
# echo "MAKE"
# apt-get install make -y

# # Install wget and gpg
# echo "WGET GPG"
# apt-get install wget gpg -y

# # Vscode
# echo "VSCODE"
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
# rm -f packages.microsoft.gpg
# apt-get install apt-transport-https
# apt-get update
# apt-get install code

# # Vagrant
# echo "VAGRANT"
# wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# apt-get update && apt-get install vagrant -y

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

## TO DO :
# - Add modification file sudoers to allow a certain member to execute through a script sudo

# # Docker
# apt-get remove $(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc | cut -f1)
# # Add Docker's official GPG key:
# apt-get update
# apt-get install ca-certificates curl
# install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
# chmod a+r /etc/apt/keyrings/docker.asc

# # Add the repository to Apt sources:
# tee /etc/apt/sources.list.d/docker.sources <<EOF
# Types: deb
# URIs: https://download.docker.com/linux/debian
# Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
# Components: stable
# Signed-By: /etc/apt/keyrings/docker.asc
# EOF

# apt-get update
# apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
# # To check installation :
# sudo docker run hello-world

# # Install kubectl
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
# install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# # To check installation :
# kubectl version --client

# # Install K3D
# wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# # To check installation :
# k3d --help

# Erase Vagrant traces => A TESTER
umount /vagrant 2>/dev/null || true
userdel -r vagrant 2>/dev/null || true # 2>/dev/null || true > avoid to stop script before reboot in case user doesn't exist 
rm -f /etc/ssh/sshd_config.d/*vagrant* 2>/dev/null || true
rm -f /etc/udev/rules.d/70-persistent-net.rules
history -c
cat /dev/null > /root/.bash_history
cat /dev/null > /home/$1/.bash_history 2>/dev/null || true

reboot