#!/bin/sh
echo thx for using this script,its my first script so make any suggestion to the github page
echo this will install the required dependencies
sudo apt-get install lib32gcc1
echo making directory /steamcmd at /home/$USER/ ....
mkdir ~/steamcmd
echo switching to the created folder
cd ~/steamcmd
echo Downloading steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
echo Extracting
tar -xvzf steamcmd_linux.tar.gz
echo do you wish to install a game now?y or n
read -r h
if test "$h" = "y"
then
     echo input your username for steam,you can log as anonymous
     read -r a
else
     echo thx for using my installer! go check my profile github for possible new scripts
     exit
fi

if test "$a" = "anonymous"
then
     echo input the appid of the game you wish to install
     read -r c
     echo input the installation path of the game in the folder /home/$USER
     read -r d
     mkdir $d
     ./steamcmd.sh +login $a +force_install_dir /home/$USER/$d +app_update $c validate
else
       echo input the password of the username you entered
       read -r b
       echo input the appid of the game you wish to install
       read -r c
       echo input the installation path of the game in the folder /home/$USER
       read -r d
       mkdir $d
       ./steamcmd.sh +login $a $b +force_install_dir /home/$USER/$d +app_update $c validate

fi

exit

