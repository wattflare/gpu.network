# Use this, if all the nvidia cards are same #
##############################################
#
#gpu_adapters=`lspci | grep VGA`
#echo "gpu_adapters: $gpu_adapters"
#gpu_count=`echo "$gpu_adapters" | wc -l`
#echo "GPU count: $gpu_count"
#for (( i=0; i<$gpu_count; i++ ))
#do  
#   sudo nvidia-smi -i $i -pl 100
#done
############################################

# This, if all the nvidia cards are NOT same #
##############################################
#
#sudo nvidia-smi -i 0 -pl 100
#sudo nvidia-smi -i 1 -pl 115
#sudo nvidia-smi -i 2 -pl 100
#sudo nvidia-smi -i 3 -pl 100
#sudo nvidia-smi -i 4 -pl 100
#sudo nvidia-smi -i 5 -pl 100
##############################################
