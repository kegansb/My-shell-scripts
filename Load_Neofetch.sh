#!/bin/bash
## Intent: Load PPA for and install Neofetch
## Created: 16-Nov-2016
## Written by: ksb1342 [Kegan Brauning]
## Ver. 0.0.1

clear

# set -x

sudo add-apt-repository ppa:dawidd0811/neofetch

sudo apt-get update 

sudo apt-get install neofetch

neofetch

done
