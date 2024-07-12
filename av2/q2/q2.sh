#!/bin/bash


OR="/home/$(whoami)"

DE="/tmp/backup"

DH=$(date +"%H%M")
AD="backup_${DH}.tar.gz"

mkdir -p "$DE"

tar -czf "${DE}/${AD}" -C "$OR" .

if [ $? -eq 0 ]; then
	echo "backup realizado com sucesso ${DE}/${AD}"
else
	echo "erro"
fi
