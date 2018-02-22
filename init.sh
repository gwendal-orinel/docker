echo '/dev/sda1 /mnt/hdd3to ntfs uid=000,gid=000,dmask=000,fmask=000 0 0' > /etc/fstab

echo -e '
ctrl_interface=/var/run/wpa_supplicant\n
network={\n
        ssid="cleon"\n
        psk=41f28f317aa1f4772db4e3823763e51dd8c257cca6405fc002ef545ecebb0aa2 \n
        scan_ssid=1 \n
        key_mgmt=WPA-PSK \n
}' > /etc/wpa_supplicant.conf

echo -e '
auto wlan0\n
iface wlan0 inet dhcp\n
wpa-driver wext\n
wpa-conf /etc/wpa_supplicant.conf\n
' > /etc/network/interfaces

ln -s /mnt/hdd3to/config/plex /var/
ln -s /mnt/hdd3to/Multimedia/ /var/plex/data
ln -s /mnt/hdd3to/config/transmission/downloads/ /var/transmission/
