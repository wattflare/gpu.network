git clone https://github.com/wattflare/gpu.network.git
cd gpu.network/
sudo ./install.rig.ubuntu18.04-kernel4.18.sh
sudo ./install-amdgpu-driver-and-sdk.sh
sudo ./install-miner-amd-kernel4.18.sh
sudo vi /etc/default/grub
sudo update-grub
sudo reboot
