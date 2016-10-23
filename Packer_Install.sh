#!/bin/bash
#The intent of this script is to install Packer on your Arch system
#Packer will install packages using both Pacman as well as Yaourt
#Information taken from a tutorial posted on www.ostechnix.com/install-packer-arch-linux-2
#15-Aug-2016

#Install required packages to begin building Packer
#Select the default to  load all the members in the core
sudo pacman -S base-devel fakeroot jshon expac git wget

#Download the pkgbuild script from the AUR
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer

#Rename the file that was just downloaded
mv PKGBUILD\?h\=packer PKGBUILD

#Compile the package
makepkg

#Install Packer
sudo pacman -U packer-*.pkg.tar.xz

#Uncomment the following line to install/apply the customizepkg modifications
#sudo pacman -S customizepkg
