# script to import an old encrypted Ubuntu zpool root
POOLID=$1
sudo zpool import -N -o readonly=on -o altroot=/mnt $POOLID oldrpool
sudo cryptsetup luksOpen /dev/zvol/oldrpool/keystore oldkeystore
sudo mount /dev/mapper/oldkeystore /mnt/oldkeystore
sudo zfs load-key oldrpool -L file:///mnt/oldkeystore/system.key

