#! /bin/sh

apps_dir=/media/mmcblk0p1/apps

source $apps_dir/stop.sh

cat $apps_dir/test_spi/test_spi.bit > /dev/xdevcfg

$apps_dir/test_spi/rffe_spi
