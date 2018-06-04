#!/bin/bash
for file in ~/rom_backup/mod.*.rom
do
  index="$(cut -d'.' -f3 <<<"$file")"
  echo "Flashing GPU $index with ${file}"
  sudo atiflash -p $index $file
done
