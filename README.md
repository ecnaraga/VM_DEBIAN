# VM_DEBIAN

## Prerequisite

- Make sure the provisioner is installed on the host machine

- Install Vagrant
``` sh
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get install vagrant -y
# vagrant plugin install vagrant-secret
```

## GITHUB TOKEN
- Create a classic token on your Github account https://github.com/settings/tokens with the options:
    - repo
    - write:public_key
    - read:org

- Copy the token in the variable GITHUB_TOKEN of your Vagrant-secret file (see below)

## Vagrant-secret file

- Create a vagrant-secret file in the same folder of the Vagrantfile - Run the following commands :
``` sh
echo "USERNAME=<my_user>" > .vagrant-secret
echo "PASS=<my_passwd>" >> .vagrant-secret
echo "GITHUB_TOKEN=<GITHUB_TOKEN>" >> .vagrant-secret
echo "GITHUB_MAIL=<GITHUB_MAIL>" >> .vagrant-secret
echo "GITHUB_NAME=<GITHUB_NAME>" >> .vagrant-secret
```