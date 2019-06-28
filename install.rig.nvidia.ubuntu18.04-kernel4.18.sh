sudo apt-get update && sudo apt-get upgrade -y
cd /tmp/
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800_4.18.0-041800.201808122131_all.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-image-unsigned-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-modules-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
sudo dpkg -i *.deb

curl -O "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.168-1_amd64.deb"
sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
sudo reboot
sudo nvidia-smi -i 0 -pl 100
sudo nvidia-smi -i 1 -pl 100
sudo nvidia-smi -i 2 -pl 100
sudo nvidia-smi -i 3 -pl 100
sudo nvidia-smi -i 4 -pl 100
sudo nvidia-smi -i 5 -pl 100

