mkdir -p ~/wtf_miners/rom_backup && cd ~/wtf_miners/rom_backup

gpu_adapters=`lspci | grep VGA`

echo "gpu_adapters: $gpu_adapters"

gpu_count=`echo "$gpu_adapters" | wc -l`

echo "GPU count: $gpu_count"

for (( i=0; i<$gpu_count; i++ ))
do  
   sudo atiflash -s $i gpu.$i.$HOSTNAME.rom
done

mkdir -p ~/rom_backup
cp -i gpu.*.$HOSTNAME.rom ~/rom_backup

#scp *.rom snj@192.168.1.XX:/home/pooladmin/rom_backups

