sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y

mkdir /amd_tmp
cd amd_tmp
wget --referer=http://support.amd.com  https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-16.40-348864.tar.xz
​tar xvf amdgpu-pro-16.40-348864.tar.xz
cd amdgpu-pro-16.40-348864
#amdgpu-pro-driver/amdgpu-pro-install
