#!/bin/bash
if [ `id -u` -eq 0 ];then
  echo "Welcome to Arch Linux"
else
  echo "Please run with root permission"
  exit 1
fi
mv /etc/pacman.conf /etc/pacman.conf.bak
mv /etc/manjaro-release /etc/manjaro-release.bak
mv /etc/pacman-mirrors.conf /etc/pacman-mirrors.conf.bak
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
cat <<EOF >/etc/pacman.conf
[options]
SigLevel = Never
LocalFileSigLevel = Optional
HoldPkg = pacman glibc
SyncFirst = pacman
Architecture = auto
Color
CheckSpace
[core]
Include = /etc/pacman.d/mirrorlist
[extra]
Include = /etc/pacman.d/mirrorlist
[community]
Include = /etc/pacman.d/mirrorlist
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF
[ -z "$SERVER" ] && SERVER='https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch'
cat <<EOF >/etc/pacman.d/mirrorlist
Server = $SERVER
EOF
pacman -Syyuu --noconfirm filesystem pacman bash linux breeze-grub breeze-gtk # Force reinstall
pacman -Rdd   --noconfirm $(pacman -Qq | grep -E 'manjaro|breath')
cp /usr/share/grub/themes/breeze /boot/grub/themes/
sed 's/^GRUB_THEME.*$/GRUB_THEME="/boot/grub/themes/breeze/theme.txt"/g' /etc/default/grub -i && grub-mkconfig -o /boot/grub/grub.cfg
exit 0
