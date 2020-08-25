sudo nano /usr/bin/init-zram-swapping

!/bin/sh

#defaults: totalmem/2  (now: 1) and swapon -p 5 (now: 32767) 

# load dependency modules
NRDEVICES=$(grep -c ^processor /proc/cpuinfo | sed 's/^0$/1/')
if modinfo zram | grep -q ' zram_num_devices:' 2>/dev/null; then
  MODPROBE_ARGS="zram_num_devices=${NRDEVICES}"
elif modinfo zram | grep -q ' num_devices:' 2>/dev/null; then
  MODPROBE_ARGS="num_devices=${NRDEVICES}"
else
  exit 1
fi
modprobe zram $MODPROBE_ARGS

# Calculate memory to use for zram (1/2 of ram)
totalmem=`LC_ALL=C free | grep -e "^Mem:" | sed -e 's/^Mem: *//' -e 's/  *.*//'`
mem=$(((totalmem / 1 / ${NRDEVICES}) * 1024))

# initialize the devices
for i in $(seq ${NRDEVICES}); do
  DEVNUMBER=$((i - 1))
  echo $mem > /sys/block/zram${DEVNUMBER}/disksize
  mkswap /dev/zram${DEVNUMBER}
  swapon -p 32767 /dev/zram${DEVNUMBER}
done





sudo nano /etc/sysctl.conf 
vm.swappiness = 10

cat /proc/sys/vm/swappiness
