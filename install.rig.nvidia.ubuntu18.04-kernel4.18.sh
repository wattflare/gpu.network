    1  sudo apt-get update && sudo apt-get upgrade -y
    2  cd /tmp/
    3  wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800_4.18.0-041800.201808122131_all.deb
    4  wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-headers-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
    5  wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-image-unsigned-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
    6  wget -c http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.18/linux-modules-4.18.0-041800-generic_4.18.0-041800.201808122131_amd64.deb
    7  sudo dpkg -i *.deb
    8  sudo reboot
    9  sudo apt update
   10  apt list --upgradable
   11  sudo apt-get purge linux-image-4.15.0-45-generic
   12  sudo reboot
   13  /sys/class/drm/card0/ll
   14  ls
   15  ls -al
   16  cd /sys/class/drm/
   17  ll
   18  cd card0/
   19  ll
   20  cd device
   21  ll
   22  cd ..
   23  cd ~
   24  ll
   25  git clone https://github.com/wattflare/gpu.network.git
   26  cd gpu.network/
   27  ll
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
   44  screen -r
   45  nvidia-smi
   46  cd wtf_miners/
   47  ll
   48  ./.runminer
   49  cd ethminer/bin/
   50  ll
   51  ./ethminer --help
   52  cd ..
   53  ll
   54  vi mine.btc.pool.wattflare.com.sh
   55  ./.runminer
   56  screen -S miner
   57  screen -r
   58  nvidia-
   59  nvidia-smi
   60  history
