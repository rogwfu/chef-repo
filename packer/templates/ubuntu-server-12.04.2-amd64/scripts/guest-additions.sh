set -x 
VMWARE_TOOLS="/tmp/VMWareTools.iso"
VBOX_TOOLS="/tmp/VBoxGuestAdditions.iso"

# Install the vmware tools
vmware() {
  echo "Found VMWare tools to install..."
  mv $VMWARE_TOOLS "/home/%%USERNAME%%/vmwaretools.iso"
   mkdir /mnt/cdrom
   mount vmwaretools.iso /mnt/cdrom/
   mkdir /home/%%USERNAME%%/working
   tar xvzf /mnt/cdrom/VMwareTools-9.2.2-893683.tar.gz -C /home/%%USERNAME%%/working/
   cd /home/%%USERNAME%%/working/vmware-tools-distrib
   ./vmware-install.pl -d
   # Should cleanup, but this works for now
}

# Install the virtualbox tools
virtualbox() {
  echo "Found VirtualBox tools to install..."
  mkdir /mnt/cdrom
  mount $VBOX_TOOLS /mnt/cdrom
  /mnt/cdrom/VBoxLinuxAdditions.run
  umount /mnt/cdrom
}

if [[ -f $VMWARE_TOOLS ]]  ; then
  vmware
elif [[ -f $VBOX_TOOLS ]] ; then
  virtualbox
else
  echo "No guest tools found.."
  exit 0
fi
