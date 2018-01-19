#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "NOT ROOT! TRY AGAIN!"
   exit 1
fi


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

git pull

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  CWD="$(pwd)"
  LSD="/etc/logstash"
  cd "$CWD"/Logstash
  echo "copying logstash configs"
  cp *.conf $LSD
  echo "DONE! Please restart logstash!"
fi
