sudo NIXOS_INSTALL_BOOTLOADER=1 /nix/var/nix/profiles/system/bin/switch-to-configuration boot
mkdir root
mount /dev/sdaX root
mkdir root/nixos-root
mv -v root/* root/nixos-root/
mv -v root/nixos-root/old-root/* root/
mv -v root/boot.bak root/boot  # We had renamed this by hand earlier
umount root
reboot
