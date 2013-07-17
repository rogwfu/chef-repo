set -x
echo "Installing the selected ssh key pair for vagrant"
mkdir /home/%%USERNAME%%/.ssh
mv /tmp/sshkeypub /home/%%USERNAME%%/.ssh/authorized_keys
chmod 700 /home/%%USERNAME%%/.ssh
chmod 600 /home/%%USERNAME%%/.ssh/authorized_keys
chown -R %%USERNAME%% /home/%%USERNAME%%/.ssh
