#!/bin/bash

#http://www.webupd8.org/p/ubuntu-ppas-by-webupd8.html
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install android-tools-adb android-tools-fastboot
echo -e "### Please edit \"/etc/udev/rules.d/51-android.rules\" to fit your requirements!"
