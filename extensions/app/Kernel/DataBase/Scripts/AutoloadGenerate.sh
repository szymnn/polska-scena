#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
clear='\033[0m'

rm -rf /home/vcmp/extensions/app/AutoLoad/Autoload.nut
interfaces=($(ls /home/vcmp/scripts/Server/Interface/*.nut))
models=($(ls /home/vcmp/scripts/Server/Model/*.nut))
controllers=($(ls /home/vcmp/scripts/Server/Controller/*.nut))

  echo "/**
  * @include interfaces
  */" >> /home/vcmp/extensions/app/AutoLoad/Autoload.nut
  for i in "${interfaces[@]}"
  do
     echo '::dofile("'$i'");' >> /home/vcmp/extensions/app/AutoLoad/Autoload.nut
  done
  echo "/**
  * @include models
  */" >> /home/vcmp/extensions/app/AutoLoad/Autoload.nut
  for i in "${models[@]}"
  do
     echo '::dofile("'$i'");' >> /home/vcmp/extensions/app/AutoLoad/Autoload.nut
  done
  echo "/**
  * @include controllers
  */" >> /home/vcmp/extensions/app/AutoLoad/Autoload.nut
  for i in "${controllers[@]}"
  do
     echo '::dofile("'$i'");' >> /home/vcmp/extensions/app/AutoLoad/Autoload.nut
  done

echo -e "$green All script has loaded successfully$clear"
