#!/bin/bash

# RX570 reference DPM states (0:300, 1:588, 2:952, 3:1041, 4:1106, 5:1168, 6:1209, 7:1244)
# for the desired core_clock choose dpm_state close to reference value, e.g. 1100MHz->4, 1150MHz->5
core_clock=1100
dpm_state=4
# mem_clocks=(2000 2000 2000 2000 2000 2000 2000 2000)
mem_clocks=(2000 2000 1975 2000 2000 2000 2000)
# set core/mem states from DPM state 4 upwards to $core_clock
for gpuid in ${!mem_clocks[*]}; do
echo "Setting up CoreStates and MemClocks GPU$gpuid"
for corestate in `seq $dpm_state 7`; do
./ohgodatool -i $gpuid --core-state $corestate --core-clock $core_clock --mem-state 2 --mem-clock ${mem_clocks[$gpuid]}
done
echo manual > /sys/class/drm/card$gpuid/device/power_dpm_force_performance_level
echo $dpm_state > /sys/class/drm/card$gpuid/device/pp_dpm_sclk
done

# vddc_voltages; start from 800mV, increase if
vddc_voltages=(800 800 800 800 800 800 800)
# set all voltage states from 1 upwards to xxx mV:
for gpuid in ${!vddc_voltages[*]}; do
echo "Setting up VDDC Voltage GPU$gpuid"
for voltstate in {1..15}; do
./ohgodatool -i $gpuid --volt-state $voltstate --vddc-table-set ${vddc_voltages[$gpuid]}
done
done

# vddci_voltages; should work @800mV for all GPU
vddci_voltages=(800 800 800 800 800 800 800)
# set VDDCI voltages to xxx mV:
for gpuid in ${!vddci_voltages[*]}; do
echo "Setting up VDDC Voltage GPU$gpuid"
for memstate in {1..2}; do
./ohgodatool -i $gpuid --mem-state $memstate --vddci ${vddci_voltages[$gpuid]}
done
done
