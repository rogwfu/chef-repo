set -x 
VMWARE_TOOLS="/tmp/VMWareTools.iso"
VBOX_TOOLS="/tmp/VBoxGuestAdditions.iso"

# Install the vmware tools
vmware() {
  echo "Found VMWare tools to install..."
  mv $VMWARE_TOOLS "/home/%%USERNAME%%/vmwaretools.iso"
}

# Install the virtualbox tools
virtualbox() {
  echo "Found VirtualBox tools to install..."
  mv $VBOX_TOOLS "/home/%%USERNAME%%/vboxadditions.iso"
}

if [[ -f $VMWARE_TOOLS ]]  ; then
  vmware
elif [[ -f $VBOX_TOOLS ]] ; then
  virtualbox
else
  echo "No guest tools found.."
  exit 0
fi
