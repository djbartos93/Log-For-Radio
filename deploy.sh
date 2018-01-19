#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "NOT ROOT! TRY AGAIN!"
   exit 1
fi

read -p "Would you like to pull changes from github before updating your config files? this will remove any local changes!" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cat << "EOF"
               ((((
              ((((
               ))))
            _ .---.
           ( |`---'|
            \|     |
            : .___, :
             `-----'
  Brewing your configs!
EOF
git stash
git pull
fi




read -p "Are you sure you want to update your configs?? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  CWD="$(pwd)"
  LSD="/etc/logstash/conf.d/"
  cd "$CWD"/Logstash
  echo "copying logstash configs"
  cp *.conf $LSD
  echo "DONE! Please restart logstash!"
fi
