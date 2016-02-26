#!/bin/sh
echo thx for using this script,its my first script so make any suggestion to the github page
echo this will install the required dependencies
sudo apt-get install lib32gcc1
# the code that verifies your achitecture is not mine, this has been made by Makeklat00, go check out his version of the installer here:https://github.com/MakeKlat00/steamcmd-multi-srv/blob/master/steamcmd-install.sh,other than that the rest is my work
if [[ "getconf LONG_BIT" == '64' ]]; then
    echo it seems that you run a 64 bit version of linux, we are going to install 32 bit requirement
    dpkg --add-architecture i386 && apt-get update && apt-get install -y ia32-libs ia32-libs-gtk
fi
echo making directory /steamcmd at /home/$USER/ ....
mkdir ~/steamcmd
echo switching to the folder
cd ~/steamcmd
echo downloading steam
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
echo do you wish to install a game now?y or n
read -r h
   
if test "$h" = "y"
then
     echo input your username for steam,you can log as anonymous
     read -r a
else
     echo thx for using my installer! we just gonna run steam for a update check
     ./steamcmd.sh +quit
     exit
fi

if test "$a" = "anonymous"
then
     echo input the appid of the game you wish to install
     read -r c
     echo input the name of the folder of the game in the directorie /home/$USER/
     read -r d
     mkdir /home/$USER/$d
     ./steamcmd.sh +login $a +force_install_dir /home/$USER/$d +app_update $c validate +quit
else
       echo input the password of the username you entered
       read -r b
       echo input the appid of the game you wish to install
       read -r c
       echo input the name of the folder of the game in the directorie /home/$USER/
       read -r d
       mkdir /home/$USER/$d
       ./steamcmd.sh +login $a $b +force_install_dir /home/$USER/$d +app_update $c validate

fi

exit 0
