COIN_ENABLED=${COIN_ENABLED:-"etc"}
#equihash
VOT_ADDR=${VOT_ADDR:-"t1ZKv84aTkcT1kvnMiY49oUgFS72Xm8jHae"}
ZCL_ADDR=${ZCL_ADDR:-"t1MDmBLNnHao3CSL57NU41fwRKEsN4V9PyX"}
ZEN_ADDR=${ZEN_ADDR:-"GET_NEW_ADDRESS"}
HUSH_ADDR=${HUSH_ADDR:-"t1WvpdsV5HZjdNuzLhngeS6ecfGjut94c3u"}
BTCZ_ADDR=${BTCZ_ADDR:-"t1Yc53Y7Sm96bxdmV9yC2tgEQNaHDC6T4SD"}
#ethash
MUSIC_ADDR=${MUSIC_ADDR:-"0x0aedeb18ed2170318b07250bf5e525dfa19104d1"}
#ETH_ADDR=${ETH_ADDR:-"0x696da6e27638bedefa280071ba692427dca95a0e"}
#snj
ETC_ADDR=${ETC_ADDR:-"0x981ffe7fd050ef04772f9d53322b6f84a57812f8"}
#drb
#ETC_ADDR=${ETC_ADDR:-"0x087db2890fb62ecbbf9066cbd607c9e115f3b7ee"}
#zsn
#ETC_ADDR=${ETC_ADDR:-"0x9b791c3d26730ae18c2f14ccccdb0105526cca55"}
#dra
#ETC_ADDR=${ETC_ADDR:-"0xed318d453f29e38ba11b18959b825b41ad8c678b"}
#krs
#ETC_ADDR=${ETC_ADDR:-"0x411d0aa1107eaa2aae72620eca11f84c7e1e2491"}
#ces
#ETC_ADDR=${ETC_ADDR:-"0x6142549f7cd1c847bb254b814ea834615e261836"}
#brr
#ETC_ADDR=${ETC_ADDR:-"0x267cc3495e7b793906dff33d694c5008ae43a7f6"}


#equihash
VOT_POOL="165.227.12.162:8034"
ZCL_POOL="165.227.12.162:3034"
ZEN_POOL="165.227.12.162:4034"
HUSH_POOL="165.227.12.162:7034"
BTCZ_POOL="165.227.12.162:5034"
#ethash
MUSIC_POOL="music.miningpool.io:8008"
ETH_POOL="eth.miningpool.io:9009"
ETC_POOL="etc.miningpool.io:7008"


current_user=$USER
current_dir=$PWD
miners_dir="$HOME/wtf_miners"

mkdir -p $miners_dir && cd $miners_dir 
git clone https://github.com/wattflare/claymore-zcash.git

#libcurl.so.4 needed for claymore
sudo apt update
sudo apt install libcurl4-openssl-dev -y
git clone https://github.com/wattflare/claymore-eth.git

#OpenCL needed for ethminer
sudo apt-get install mesa-common-dev -y
mkdir -p ethminer && cd ethminer
wget https://github.com/ethereum-mining/ethminer/releases/download/v0.16.1/ethminer-0.16.1-linux-x86_64.tar.gz && tar xvzf ethminer-0.16.1-linux-x86_64.tar.gz

cd $current_dir

#create coin mining scripts

#equihash
echo "$miners_dir/claymore-zcash/zecminer64 -zpool $VOT_POOL  -zwal $VOT_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.vot.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $ZCL_POOL  -zwal $ZCL_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.zcl.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $ZEN_POOL  -zwal $ZEN_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.zen.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $HUSH_POOL  -zwal $HUSH_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.hush.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $BTCZ_POOL  -zwal $BTCZ_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.btcz.pool.wattflare.com.sh

#ethash
echo "$miners_dir/ethminer/bin/ethminer -G -P stratum1+tcp://$MUSIC_ADDR.$HOSTNAME@$MUSIC_POOL" > $miners_dir/mine.music.pool.wattflare.com.sh 
echo "$miners_dir/ethminer/bin/ethminer -G -P stratum1+tcp://$ETH_ADDR.$HOSTNAME@$ETH_POOL" > $miners_dir/mine.eth.pool.wattflare.com.sh
echo "$miners_dir/ethminer/bin/ethminer -G -P stratum1+tcp://$ETC_ADDR.$HOSTNAME@$ETC_POOL" > $miners_dir/mine.etc.pool.wattflare.com.sh

#make mining scripts executable
chmod +x $miners_dir/mine.*.pool.wattflare.com.sh

#create .runminer file
echo "export GPU_MAX_HEAP_SIZE=100" > $miners_dir/.runminer
echo "export GPU_USE_SYNC_OBJECTS=1" >> $miners_dir/.runminer
echo "export GPU_MAX_ALLOC_PERCENT=100" >> $miners_dir/.runminer
echo "export GPU_SINGLE_ALLOC_PERCENT=100" >> $miners_dir/.runminer
echo "$miners_dir/mine.$COIN_ENABLED.pool.wattflare.com.sh" >> $miners_dir/.runminer

#make .runminer executsable
chmod +x $miners_dir/.runminer 

#setup miner as start-up service
sudo miners_dir=$miners_dir current_user=$current_user su -c "./add-miner-service.sh"

## Enable this when amd drivers doesn't need restart. And disable reboot below
#echo "Starting runminer service..."
#sudo su -c "service runminer start"
echo "Congratutaions! wattflare AMD miners installation was sucessfull!"
#echo "Rebooting rig... Mining will start automatically. After reboot type \"screen -r miner\" to view miner activity"
#sudo sleep 5
#sudo reboot
echo "Update GRUB if you've not already updated"
echo "sudo vi /etc/default/grub"
echo "amdgpu.vm_fragment_size=9 pci=noaer"
echo "sudo update-grub"
