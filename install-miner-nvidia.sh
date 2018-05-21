
COIN_ENABLED=${COIN_ENABLED:-"music"}
#equihash
VOT_ADDR=${VOT_ADDR:-"t1ZKv84aTkcT1kvnMiY49oUgFS72Xm8jHae"}
ZCL_ADDR=${ZCL_ADDR:-"GET_NEW_ADDRESS"}
ZEN_ADDR=${ZEN_ADDR:-"GET_NEW_ADDRESS"}
HUSH_ADDR=${HUSH_ADDR:-"GET_NEW_ADDRESS"}
BTCZ_ADDR=${BTCZ_ADDR:-"t1Yc53Y7Sm96bxdmV9yC2tgEQNaHDC6T4SD"}

#ethash
MUSIC_ADDR=${MUSIC_ADDR:-"0x0aedeb18ed2170318b07250bf5e525dfa19104d1"}
ETH_ADDR=${ETH_ADDR:-"0x696da6e27638bedefa280071ba692427dca95a0e"}
#equihash
VOT_POOL="pool.wattflare.com"
ZCL_POOL="pool.wattflare.com"
ZEN_POOL="pool.wattflare.com"
HUSH_POOL="pool.wattflare.com"
BTCZ_POOL="bitcoinz.miningpool.io"

#ethash
MUSIC_POOL="stratum+tcp://music.gpu.network:8008"
ETH_POOL="stratum+tcp://eth.gpu.network:9009"

VOT_POOL_PORT="8034"
ZCL_POOL_PORT="3034"
ZEN_POOL_PORT="4034"
HUSH_POOL_PORT="7034"
BTCZ_POOL_PORT="5034"

current_user=$USER
current_dir=$PWD
miners_dir="$HOME/wtf_miners"

mkdir $miners_dir && cd $miners_dir 
git clone https://github.com/wattflare/ewbf-zcash.git

#libcurl.so.4 needed for claymore
sudo apt update
sudo apt install libcurl4-openssl-dev -y
git clone https://github.com/wattflare/claymore-eth.git
cd $current_dir

#create coin mining scripts

echo "$miners_dir/ewbf-zcash/miner --server $VOT_POOL  --port $VOT_POOL_PORT --user $VOT_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.vot.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $ZCL_POOL  --port $ZCL_POOL_PORT --user $ZCL_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.zcl.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $ZEN_POOL  --port $ZEN_POOL_PORT --user $ZEN_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.zen.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $HUSH_POOL  --port $HUSH_POOL_PORT --user $HUSH_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.hush.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $BTCZ_POOL  --port $BTCZ_POOL_PORT --user $BTCZ_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.btcz.pool.wattflare.com.sh

#ethash
echo "$miners_dir/claymore-eth/ethdcrminer64 -epool $MUSIC_POOL -eworker $HOSTNAME -ewal $MUSIC_ADDR -epsw x" > $miners_dir/mine.music.pool.wattflare.com.sh -allpools 1
echo "$miners_dir/claymore-eth/ethdcrminer64 -epool $ETH_POOL -eworker $HOSTNAME -ewal $ETH_ADDR -epsw x" > $miners_dir/mine.eth.pool.wattflare.com.sh


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
