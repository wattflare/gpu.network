#!/bin/bash
for file in ~/rom_backup/gpu.*.rom
do
  index="$(cut -d'.' -f2 <<<"$file")"
  echo "Restoring/flashing GPU $index with ${file}"
  sudo atiflash -p $index $file
done
