echo ------- Do you wish to install the dependencies ? [y or n] -------
read -r h
if test "$h" = "y"
then
  echo ------- This will install the required dependencies -------
  sudo apt-get install lib32gcc1
fi

# the code that verifies your architecture is not mine, this has been made by Makeklat00, go check out his version of the installer here:https://github.com/MakeKlat00/steamcmd-multi-srv/blob/master/steamcmd-install.sh,other than that the rest is my work
if [[ "getconf LONG_BIT" == '64' ]]; then
  echo ------- It seems that you are running a 64 bit version of linux, we are going to install 32 bit requirement -------
  dpkg --add-architecture i386 && apt-get update && apt-get install -y ia32-libs ia32-libs-gtk
fi

insdir="$1"
if [ -n "$insdir" ]; then
  echo ------- Making directory /steamcmd at $insdir -------
else
  echo ------- Making directory /steamcmd at /home/$USER -------
  insdir="/home/$USER"
fi

# Making a directory and switching into it
mkdir $insdir/steamcmd
cd $insdir/steamcmd
#TODO:implement an md5 sum checker
echo ------- Downloading steam -------
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz

# Make it executable
chmod +x steamcmd.sh

echo ------- Do you wish to install a game now ? [y or n] -------
read -r h
   
if test "$h" = "y"
then
  echo ------- Input your username for steam, or login as anonymous -------
  read -r a
  if [ -z "$a" ]; then
     echo ------ please put a username ------
     read -r a
else
  echo ------- Running steam update check -------
  ./steamcmd.sh +quit
  exit
fi

if test "$a" = "anonymous"
then
  echo ------- Game appid you wish to install -------
  read -r c
  if [ -z "$c" ]; then
     echo ----- please put an appid -------
     read -r c
  fi
  echo ------- Game path in the folder $insdir -------
  read -r d
  if [ -z "$d" ]; then
     echo ------ please put the path -------
     read -r d
  fi
  mkdir $insdir/$d
  ./steamcmd.sh +login $a +force_install_dir $insdir/$d +app_update $c validate +quit
else
  echo ------- Password of the username you entered -------
  read -r b
  if [ -z "$b" ]; then
     echo ------ please put a password ------
     read -r b
  fi
  echo ------- Game appid you wish to install -------
  read -r c
  if [ -z "$c" ]; then
     echo ------ please put an appid ------
     read -r c
  fi
  echo ------- Game path in the folder $insdir -------
  read -r d
  if [ -z "$d" ]; then
     echo ------ please put the path -------
     read -r d
  fi
  mkdir $insdir/$d
  ./steamcmd.sh +login $a $b +force_install_dir $insdir/$d +app_update $c validate +quit
fi

exit
