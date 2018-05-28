#!/bin/bash
for file in ~/rom_backup/mod.*.rom
do
  index="$(cut -d'.' -f3 <<<"$file")"
  echo "Flashing GPU $index with ${file}"
  sudo atiflash -p $index $file
done

#echo "manual" > /sys/class/drm/card8/device/power_dpm_force_performance_level
#/opt/ohgodatool/ohgodatool -i 8 --set-fanspeed 60 --core-state 3 --core-clock 1050
#echo 3 > /sys/class/drm/card8/device/pp_dpm_sclk
#/opt/ohgodatool/ohgodatool -i 8 --set-max-power 110
#/opt/ohgodatool/ohgodatool -i 8 --mem-state "2" --mem-clock "1950"

#The following commands must be run while logged in as root. sudo will not work!

#echo "3" > /sys/class/drm/card8/device/pp_dpm_sclk
#echo "manual" > /sys/class/drm/card8/device/power_dpm_force_performance_level
