#!/usr/bin/bash

clear 
while true
do
  for i in $(seq 8)
  do
    tput cup 10 0
    cat ./ascii_art/moon${i}.txt
    sleep 1
  done
done
