COIN_ENABLED=${COIN_ENABLED:-"hush"}

VOT_ADDR=${VOT_ADDR:-"t1ZKv84aTkcT1kvnMiY49oUgFS72Xm8jHae"}
ZCL_ADDR=${ZCL_ADDR:-"GET_NEW_ADDRESS"}
ZEN_ADDR=${ZEN_ADDR:-"GET_NEW_ADDRESS"}
HUSH_ADDR=${HUSH_ADDR:-"t1WvpdsV5HZjdNuzLhngeS6ecfGjut94c3u"}
BTCZ_ADDR=${BTCZ_ADDR:-"t1Yc53Y7Sm96bxdmV9yC2tgEQNaHDC6T4SD"}

VOT_POOL="pool.wattflare.com:8034"
ZCL_POOL="pool.wattflare.com:3034"
ZEN_POOL="pool.wattflare.com:4034"
HUSH_POOL="pool.wattflare.com:7034"
BTCZ_POOL="bitcoinz.miningpool.io:5034"

current_user=$USER
current_dir=$PWD
miners_dir="$HOME/wtf_miners"

mkdir $miners_dir && cd $miners_dir 
git clone https://github.com/wattflare/claymore-zcash.git
cd $current_dir

#create coin mining scripts

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $VOT_POOL  -zwal $VOT_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.vot.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $ZCL_POOL  -zwal $ZCL_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.zcl.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $ZEN_POOL  -zwal $ZEN_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.zen.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $HUSH_POOL  -zwal $HUSH_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.hush.pool.wattflare.com.sh

echo "$miners_dir/claymore-zcash/zecminer64 -zpool $BTCZ_POOL  -zwal $BTCZ_ADDR.$HOSTNAME -zpsw x" > $miners_dir/mine.btcz.pool.wattflare.com.sh

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

