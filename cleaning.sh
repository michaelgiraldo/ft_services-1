#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo -e "$Green Cleaning starts!\n$Color_Off"

# remove deployment
echo -e "$Green Delete k8s deployment & service\n$Color_Off"
kubectl delete -k ./

# remove all images
echo -e "$Green Remove docker images\n$Color_Off"
docker image prune -a --force
docker container prune -f

echo -e "$Green Cleaning finishes!$Color_Off"
