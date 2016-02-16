#!/bin/sh
echo thx for using this script,its my first script so make any suggestion to the github page
echo this will instal the required dependencies
sudo apt-get install lib32gcc1
echo making directory /steamcmd at /home/$USER/ ....
mkdir ~/steamcmd
echo switching to the created folder
cd ~/steamcmd
echo Downloading steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
echo Extracting
tar -xvzf steamcmd_linux.tar.gz
echo input your username for steam
read -r a
echo input the password of the username you entered
read -r b
echo input the appid of the game you wish to install
read -r c
echo input the installation path of the game(this will create a new directory)
read -r d
mkdir $d
./steamcmd.sh +login $a $b +force_install_dir $d +app_update $c validate 
