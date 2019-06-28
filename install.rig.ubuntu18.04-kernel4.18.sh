sudo apt-get update && sudo apt-get upgrade -y
cd /tmp/
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800_4.18.0-041800.201808122131_all.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-image-unsigned-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-modules-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
sudo dpkg -i *.deb

sudo reboot
