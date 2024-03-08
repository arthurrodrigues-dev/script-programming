#!/bin/bash

echo "Bom dia"

data_atual=$(date +"%d/%m/%Y")
echo "Data atual: $data_atual"

dia_semana=$(date +"%A")
echo "Dia da semana: $dia_semana"

nome_user=$(whoami)
echo "Nome do usuário: $nome_user"
