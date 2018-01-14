echo "current_user=$current_user"

#create runminer service file
echo "Adding miner service as user:"
whoami
echo "[Unit]" > /etc/systemd/system/runminer.service
echo "Description=wattflare gpu miner; configure miner 'vi $miners_dir/.runminer'; view miner 'screen -r miner'" >> /etc/systemd/system/runminer.service
echo "After=network.target" >> /etc/systemd/system/runminer.service
echo "" >> /etc/systemd/system/runminer.service
echo "[Service]" >> /etc/systemd/system/runminer.service
echo "User=$current_user" >> /etc/systemd/system/runminer.service
echo "Group=$current_user" >> /etc/systemd/system/runminer.service
echo "" >> /etc/systemd/system/runminer.service
echo "Type=forking" >> /etc/systemd/system/runminer.service
echo "ExecStart=/usr/bin/screen -d -m -S miner $miners_dir/.runminer" >> /etc/systemd/system/runminer.service
echo "ExecStop=/usr/bin/killall -w -s 2 miner" >> /etc/systemd/system/runminer.service
echo "WorkingDirectory=~" >> /etc/systemd/system/runminer.service
echo "" >> /etc/systemd/system/runminer.service
echo "[Install]" >> /etc/systemd/system/runminer.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/runminer.service

#enable runminer service
systemctl enable runminer.service

