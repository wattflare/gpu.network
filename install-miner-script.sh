git clone https://github.com/wattflare/claymore-zcash.git

#create .runminer config file
echo "$HOME/miners/claymore-zcash/start.pool.wattflare.vot.sh" > ~/.runminer

#setup miner as start-up service
sudo su -c ./add-miner-service.sh
