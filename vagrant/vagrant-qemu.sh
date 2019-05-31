#***********************************************************
# Vagrant QEMU / KVM Dependencies
#***********************************************************

sudo apt-get build-dep vagrant ruby-libvirt
sudo apt-get install qemu libvirt-bin ebtables dnsmasq-base
sudo apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev


#***********************************************************
# Vagrant QEMU / KVM Plugin
#***********************************************************

sudo vagrant plugin install vagrant-libvirt

#***********************************************************
# Download, copy, and install vagrant
#***********************************************************
sudo apt install unzip
sudo wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip
sudo unzip terraform_0.12.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

#***********************************************************
# Start Vagrant VM
# In prepared project directory, run following command:
#***********************************************************

# vagrant up --provider=libvirt