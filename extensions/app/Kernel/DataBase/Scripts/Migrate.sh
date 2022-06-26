#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
clear='\033[0m'

rm -rf /home/vcmp/extensions/app/AutoLoad/Migrations.nut
array=($(ls /home/vcmp/scripts/Server/Migrations/*.nut))

for i in "${array[@]}"
do
   echo '::dofile("'$i'");' >> /home/vcmp/extensions/app/AutoLoad/Migrations.nut
done

echo -e "Migration file is created$green successfully$clear\nYou must restart your server"
