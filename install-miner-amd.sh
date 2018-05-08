COIN_ENABLED=${COIN_ENABLED:-"music"}
#equihash
VOT_ADDR=${VOT_ADDR:-"t1ZKv84aTkcT1kvnMiY49oUgFS72Xm8jHae"}
ZCL_ADDR=${ZCL_ADDR:-"t1MDmBLNnHao3CSL57NU41fwRKEsN4V9PyX"}
ZEN_ADDR=${ZEN_ADDR:-"GET_NEW_ADDRESS"}
HUSH_ADDR=${HUSH_ADDR:-"t1WvpdsV5HZjdNuzLhngeS6ecfGjut94c3u"}
BTCZ_ADDR=${BTCZ_ADDR:-"t1Yc53Y7Sm96bxdmV9yC2tgEQNaHDC6T4SD"}
#ethash
MUSIC_ADDR=${MUSIC_ADDR:-"0x0aedeb18ed2170318b07250bf5e525dfa19104d1"}
ETH_ADDR=${MUSIC_ADDR:-"0x0aedeb18ed2170318b07250bf5e525dfa19104d1"}

#equihash
VOT_POOL="165.227.12.162:8034"
ZCL_POOL="165.227.12.162:3034"
ZEN_POOL="165.227.12.162:4034"
HUSH_POOL="165.227.12.162:7034"
BTCZ_POOL="165.227.12.162:5034"
#ethash
MUSIC_POOL="stratum+tcp://music.gpu.network:8008"
ETH_POOL="stratum+tcp://music.gpu.network:9009"

current_user=$USER
current_dir=$PWD
miners_dir="$HOME/wtf_miners"

mkdir $miners_dir && cd $miners_dir 
git clone https://github.com/wattflare/claymore-zcash.git
git clone https://github.com/wattflare/claymore-eth.git
cd $current_dir

#create coin mining scripts

#equihash
echo "$miners_dir/claymore-zcash/zecminer64 -zpool $VOT_POOL  -zwal $VOT_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.vot.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $ZCL_POOL  -zwal $ZCL_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.zcl.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $ZEN_POOL  -zwal $ZEN_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.zen.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $HUSH_POOL  -zwal $HUSH_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.hush.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $BTCZ_POOL  -zwal $BTCZ_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.btcz.pool.wattflare.com.sh

#ethash
echo "$miners_dir/claymore-eth/ethdcrminer64 -epool $MUSIC_POOL  -ewal $MUSIC_ADDR.$HOSTNAME -epsw x" > $miners_dir/mine.music.pool.wattflare.com.sh -allpools 1
echo "$miners_dir/claymore-eth/ethdcrminer64 -epool $ETH_POOL  -ewal $ETH_ADDR.$HOSTNAME -epsw x" > $miners_dir/mine.eth.pool.wattflare.com.sh

#make mining scripts executable
chmod +x $miners_dir/mine.*.pool.wattflare.com.sh

#create .runminer file
echo "$miners_dir/mine.$COIN_ENABLED.pool.wattflare.com.sh" > $miners_dir/.runminer

#make .runminer executsable
chmod +x $miners_dir/.runminer 

#setup miner as start-up service
sudo miners_dir=$miners_dir current_user=$current_user su -c "./add-miner-service.sh"

## Enable this when amd drivers doesn't need restart. And disable reboot below
#echo "Starting runminer service..."
#sudo su -c "service runminer start"
echo "Congratutaions! wattflare AMD miners installation was sucessfull!"
echo "Rebooting rig... Mining will start automatically. After reboot type \"screen -r miner\" to view miner activity"
sudo sleep 5
sudo reboot

