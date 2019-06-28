sudo apt-get update && sudo apt-get upgrade -y
cd /tmp/
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800_4.18.0-041800.201808122131_all.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-image-unsigned-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-modules-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
sudo dpkg -i *.deb

sudo reboot

   28  ./install-miner-amd.sh
   29  cd ~/wtf_miners/
   30  ./.runminer
   31  sudo ./.runminer
   32  cd /tmp/
   33  ll
   34  curl -O "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-10-1_10.1.168-1_amd64.deb"
   35  ll
   36  rm -rf cuda-10-1_10.1.168-1_amd64.deb
   37  curl -O "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.168-1_amd64.deb"
   38  sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
   39  sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
   40  sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
   41  sudo apt-get update
   42  sudo apt-get install cuda
   43  sudo reboot
   44  nvidia-smi -i 0 -pl 100
   45  sudo nvidia-smi -i 0 -pl 100
   46  sudo nvidia-smi -i 1 -pl 100
   47  sudo nvidia-smi -i 1 -pl 115
   48  sudo nvidia-smi -i 2 -pl 100
   49  sudo nvidia-smi -i 3 -pl 100
   50  sudo nvidia-smi -i 4 -pl 100
   51  history
