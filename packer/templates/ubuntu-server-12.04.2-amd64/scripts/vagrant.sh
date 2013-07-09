echo "Installing the ssh key pair for vagrant"
mkdir /home/%%USERNAME%%/.ssh
chmod 700 /home/%%USERNAME%%/.ssh
cd /home/%%USERNAME%%/.ssh
#wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/%%USERNAME%%/.ssh/authorized_keys
chown -R %%USERNAME%% /home/%%USERNAME%%/.ssh
