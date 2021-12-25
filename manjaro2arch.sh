#!/bin/bash
if [ `id -u` -eq 0 ];then
  echo "Welcome to ArchLinux"
else
  echo "Please run with root permission"
  exit
fi
mv /etc/pacman.conf /etc/pacman.conf.bak
mv /etc/manjaro-release /etc/manjaro-release.bak
mv /etc/pacman-mirrors.conf /etc/pacman-mirrors.conf.bak
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo '[options]
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
Include = /etc/pacman.d/mirrorlist' > /etc/pacman.conf
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo 'NAME="Arch Linux"
ID=arch
PRETTY_NAME="Arch Linux"
ANSI_COLOR="0;36"
HOME_URL="https://www.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://bugs.archlinux.org/"' > /etc/os-release
echo 'Arch Linux \r (\l)' > /etc/issue
echo 'LSB_VERSION=1.4
DISTRIB_ID=Arch
DISTRIB_RELEASE=rolling
DISTRIB_DESCRIPTION="Arch Linux"' > /etc/lsb-release
pacman -Syyu
pacman -Sy linux linux-headers neofetch
neofetch
