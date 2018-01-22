
COIN_ENABLED=${COIN_ENABLED:-"btcz"}

VOT_ADDR=${VOT_ADDR:-"t1ZKv84aTkcT1kvnMiY49oUgFS72Xm8jHae"}
ZCL_ADDR=${ZCL_ADDR:-"GET_NEW_ADDRESS"}
ZEN_ADDR=${ZEN_ADDR:-"GET_NEW_ADDRESS"}
HUSH_ADDR=${HUSH_ADDR:-"GET_NEW_ADDRESS"}
BTCZ_ADDR=${BTCZ_ADDR:-"t1Yc53Y7Sm96bxdmV9yC2tgEQNaHDC6T4SD"}

VOT_POOL="pool.wattflare.com"
ZCL_POOL="pool.wattflare.com"
ZEN_POOL="pool.wattflare.com"
HUSH_POOL="pool.wattflare.com"
BTCZ_POOL="bitcoinz.miningpool.io"

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
cd $current_dir

#create coin mining scripts

echo "$miners_dir/ewbf-zcash/miner --server $VOT_POOL  --port $VOT_POOL_PORT --user $VOT_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.vot.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $ZCL_POOL  --port $ZCL_POOL_PORT --user $ZCL_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.zcl.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $ZEN_POOL  --port $ZEN_POOL_PORT --user $ZEN_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.zen.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $HUSH_POOL  --port $HUSH_POOL_PORT --user $HUSH_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.hush.pool.wattflare.com.sh

echo "$miners_dir/ewbf-zcash/miner --server $BTCZ_POOL  --port $BTCZ_POOL_PORT --user $BTCZ_ADDR.$HOSTNAME --pass x --eexit 1" > $miners_dir/mine.btcz.pool.wattflare.com.sh

#make mining scripts executable
chmod +x $miners_dir/mine.*.pool.wattflare.com.sh

#create .runminer file
echo "$miners_dir/mine.$COIN_ENABLED.pool.wattflare.com.sh" > $miners_dir/.runminer

#make .runminer executsable
chmod +x $miners_dir/.runminer 

#setup miner as start-up service
sudo miners_dir=$miners_dir current_user=$current_user su -c "./add-miner-service.sh"

echo "Starting runminer service..."

sudo su -c "service runminer start"

echo "Started runminer service, type \"screen -r miner\" to view miner activity"
