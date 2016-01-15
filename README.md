# MiniPwner-fixed
MiniPwner's website and forums aren't exactly clear on what you need to do. I'm here to help!

All credit goes to Kevin Bong & Michael Vieau for the initial project idea.

I'm just here to clean up a little.

NOTE** This documentation is still being written and cleaned up, please excuse the mess.

What You'll Need
TP-Link MR3040
SanDisk 16GB USB drive (or equivalent)
MiniPwner Overlay - found http://minipwner.com/images/Overlay/minipwner-overlay_2.0.0.tar (will mirror on my github)
Format USB Drive
Setup two partitions on the USB drive, 1 500 MB partition for swap space and the rest of the space for storage.
This can be done on a Linux system using fdisk or GParted
Partition 1 = 500 MB SWAP
Partition 2 = 15.5GB ext4
Install OpenWrt
Download OpenWrt Barrier Breaker from https://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/openwrt-ar71xx-generic-tl-mr3040-v2-squashfs-factory.bin
Boot your TP-Link 3040 and login at http://192.168.0.1 (default credentials are admin/admin)
Select System Tools and then Firmware Upgrade
Use the Choose File button to select the OpenWrt Barrier Breaker image
Use the Upgrade button to apply the image
Wait for the image to be applied
After the TP-Link reboots it will now be at 192.168.1.1
The Setup
Telnet to the TP-Link at 192.168.1.1
Set a root password with the passwd command
NOTE: ** You will need to get the TP-Link onto the Internet to download packages **
Install the following packages to enable USB support
kmod-scsi-core
kmod-usb-storage
block-mount
kmod-lib-crc16
kmod-crypto-hash
kmod-fs-ext4
Plug the USB drive into the 3G port and reboot the TP-Link
Log into the TP-Link via ssh using the user root and the password you just set
Modify the /etc/config/fstab to match the following
Run the following commands to "pivot root" to the USB drive
mkdir -p /tmp/cproot
mount --bind / /tmp/cproot
mkdir /mnt/sda2
mount /dev/sda2 /mnt/sda2
tar -C /tmp/cproot -cvf - . | tar -C /mnt/sda2 -xf -
umount /tmp/cproot
You now need to modifiy the /etc/config/fstab again so it will boot off the USB drive
Reboot the TP-Link (and now it becomes a MiniPwner)
Verify the USB drive is mounted correctly by issuing the df command

root @ OpenWrt: ~ # opkg update

root @ OpenWrt: ~ # opkg install libpcap libstdcpp libpthread bzip2 zlib libopenssl libbz2 terminfo libnet1 libpcre libltdl libncurses librt libruby wireless-tools-common hostapd kmod-madwifi-old ruby ​​uclibcxx libnl libcap libreadline libdnet libdaq libuuid libffi python-openssl-util mini kmod- tun liblzo libevent2-core libevent2 libevent2-openssl-extra-pthreads libevent2 libevent2 elinks aircrack-ng-client ettercap karma kismet kismet kismet-drone-server netcat nbtscan nmap-easy-rsa openvpn openvpn openssl-perl samba36-client-server snort tar samba36 tcpdump TMux yafc python wget vim unzip

Upload the MiniPwner Overlay tar file to the /tmp directory
Untar the file by issuing tar -xf MiniPwner-Setup_x.x.x.tar (where x.x.x is the version number)
Run the setup script by issuing sh setup.sh (still in progress as the original shell script is dos, not unit, use ":set ff=unix" in vi to fix this. 
Make sure the three position switch is in the middle position (WISP) and then reboot the MiniPwner
