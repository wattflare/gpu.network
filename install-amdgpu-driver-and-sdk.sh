sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y

wget --referer=http://support.amd.com  https://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-16.40-348864.tar.xz \
&& tar xvf amdgpu-pro-16.40-348864.tar.xz \
&& amdgpu-pro-16.40-348864/amdgpu-pro-install -y

wget https://github.com/wattflare/install-miners/releases/download/AMD-SDK/AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
&& tar xf AMD-APP-SDKInstaller-v3.0.130.136-GA-linux64.tar.bz2 \
&& sudo ./AMD-APP-SDK-v3.0.130.136-GA-linux64.sh

sudo usermod -a -G video $LOGNAME
