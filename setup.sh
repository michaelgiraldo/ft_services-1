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

echo -e "$Purple Process starts!\n$Color_Off"

echo -e "$Purple Build Docker Image\n$Color_Off"
docker build -t nginx nginx/

# echo -e "$Purple Install Nginx Ingress Controller\n$Color_Off"
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml

echo -e "$Purple Create ingress secrets\n$Color_Off"
kubectl create secret tls ingress-secret-1 --key ingress/1_localhost.key --cert ingress/1_localhost.cert 
kubectl create secret tls ingress-secret-2 --key ingress/2_localhost.key --cert ingress/2_localhost.cert 

echo -e "$Purple Create k8s objects\n$Color_Off"
kubectl apply -k ./

echo -e "$Purple\nDisplay all k8s objects\n$Color_Off"
kubectl get all

# docker desktop ip
# 192.168.1.104

# Run the image in docker 
# docker run --rm -it -p 80:80 -p 443:443 nginx:latest

# get all kubernetes content
# kubectl get all

# apply kustimization file is a quick way to deploy all ymal files
# (create & reconfigure) kubectl apply -k ./ 
# (delete) kubectl delete -k ./

# get all kubernetes resources on all namespaces
# kubectl get all --all-namespaces

# check the file system inside a pod container
# kubectl exec -it pod_name  -- /bin/sh
# or 
# kubectl exec -it pod_name  -- /bin/bash
