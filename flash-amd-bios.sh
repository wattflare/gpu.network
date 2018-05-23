wget https://github.com/d13g0s0uz4/atiflash/releases/download/0.1/atiflash_linux.tar.xz -O /tmp/atiflash_linux.tar.xz && sudo tar xvf /tmp/atiflash_linux.tar.xz -C /usr/local/bin/

mkdir rom_backup && cd rom_backup

sudo atiflash -s 0 gpu.0.mx1as021.rx570.rom
sudo atiflash -s 1 gpu.1.mx1as021.rx570.rom
sudo atiflash -s 2 gpu.2.mx1as021.rx570.rom
sudo atiflash -s 3 gpu.3.mx1as021.rx570.rom
sudo atiflash -s 4 gpu.4.mx1as021.rx570.rom
sudo atiflash -s 5 gpu.5.mx1as021.rx570.rom

#scp bios files to Windows and mod the bios with PolarisBiosEditor

#scp back the modded bios and flash the amd bios

sudo atiflash -p 0 mod.gpu.0.mx1as021.rx570.rom
sudo atiflash -p 1 mod.gpu.1.mx1as021.rx570.rom
sudo atiflash -p 2 mod.gpu.2.mx1as021.rx570.rom
sudo atiflash -p 3 mod.gpu.3.mx1as021.rx570.rom
sudo atiflash -p 4 mod.gpu.4.mx1as021.rx570.rom
sudo atiflash -p 5 mod.gpu.5.mx1as021.rx570.rom
