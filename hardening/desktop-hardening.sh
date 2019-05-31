#***********************************************************
# Install ansible
#***********************************************************

sudo apt install -y ansible


#***********************************************************
# Create or append ansible requirements file
#***********************************************************

sudo sh -c "echo '- src: https://github.com/joelradon/ubuntu1804-desktop-cis.git' >> /etc/ansible/requirements.yml"


#***********************************************************
# Install the role for CIS Ubuntu script from Github
#***********************************************************

cd /etc/ansible/
sudo ansible-galaxy install -p roles -r /etc/ansible/requirements.yml

#***********************************************************
# Create Ansible Playbook for CIS Ubuntu script
#***********************************************************

sudo sh -c "cat > /etc/ansible/harden.yml <<EOF
- name: Harden Server
  hosts: localhost
  connection: local
  become: yes

  roles:
    - Ubuntu1804-CIS
    
EOF
"


#***********************************************************
# Run ansible playbook file
# DO NOT RUN ON PRODUCTION!!!!
#***********************************************************

sudo ansible-playbook /etc/ansible/harden.yml


#***********************************************************
# Restart SSH. You will lose the ability to ssh as root!
#***********************************************************

sudo systemctl restart sshd
