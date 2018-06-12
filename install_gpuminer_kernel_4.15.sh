sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y

kernel=`uname -r`

if [ "$kernel" = "4.15.0-041500-generic" ]; then
  echo "Kernel is up to date: $kernel"
else

cd /tmp/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15/linux-headers-4.15.0-041500_4.15.0-041500.201802011154_all.deb

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15/linux-headers-4.15.0-041500-generic_4.15.0-041500.201802011154_amd64.deb

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15/linux-image-4.15.0-041500-generic_4.15.0-041500.201802011154_amd64.deb

sudo dpkg -i *.deb

fi

mkdir -p ~/wtf_miners && cd ~/wtf_miners

git clone https://github.com/OhGodACompany/OhGodATool.git
cd OhGodATool
make

cd ..
git clone -b krussell/fixes --single-branch https://github.com/RadeonOpenCompute/ROC-smi.git



