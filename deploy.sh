#!/bin/bash

#Renk tanimlari
Green='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE} Dağıtım işlemleri başlıyor ${NC}"

rsync -avz --delete public/ sunucum:/var/www/html/

echo -e "${GREEN} Web sitesi güncellendi ${NC}"
