sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y

cd /tmp/

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15/linux-headers-4.15.0-041500_4.15.0-041500.201801282230_all.deb

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15/linux-headers-4.15.0-041500-generic_4.15.0-041500.201801282230_amd64.deb

wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15/linux-image-4.15.0-041500-generic_4.15.0-041500.201801282230_amd64.deb

sudo dpkg -i *.deb

git clone https://github.com/OhGodACompany/OhGodATool.git
cd OhGodATool
make
cd ..


wget https://github.com/d13g0s0uz4/atiflash/releases/download/0.1/atiflash_linux.tar.xz -O /tmp/atiflash_linux.tar.xz && sudo tar xvf /tmp/atiflash_linux.tar.xz -C /usr/local/bin/



