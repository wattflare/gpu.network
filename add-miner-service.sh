#create runminer service file
echo "Adding miner service as user:"
whoami
echo "[Unit]" > /etc/systemd/system/runminer.service
echo "Description=wattflare gpu miner; configure miner 'vi ~/.runminer'; view miner 'screen -r miner'" >> /etc/systemd/system/runminer.service
echo "After=network.target" >> /etc/systemd/system/runminer.service
echo "" >> /etc/systemd/system/runminer.service
echo "[Service]" >> /etc/systemd/system/runminer.service
echo "User=$USER" >> /etc/systemd/system/runminer.service
echo "Group=$USER" >> /etc/systemd/system/runminer.service
echo "" >> /etc/systemd/system/runminer.service
echo "Type=forking" >> /etc/systemd/system/runminer.service
echo "ExecStart=/usr/bin/screen -d -m -S miner $HOME/.runminer" >> /etc/systemd/system/runminer.service
echo "ExecStop=/usr/bin/killall -w -s 2 miner" >> /etc/systemd/system/runminer.service
echo "WorkingDirectory=~" >> /etc/systemd/system/runminer.service
echo "" >> /etc/systemd/system/runminer.service
echo "[Install]" >> /etc/systemd/system/runminer.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/runminer.service

#enable runminer service
systemctl enable runminer.service

#launch runminer service
#service runminer start
