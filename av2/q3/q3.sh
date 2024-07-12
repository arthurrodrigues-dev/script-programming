#!/bin/bash


DA=$(yad --title "Agendamento do script de backup" \
	--text "Data para o backup:" \
	--calendar \
	--button="OK!gtk-ok:0" \
	--date-format="%Y-%m-%d" \
	--width=300 --height=300)

if [ $? -ne 0 ]; then
	yad --title "Agendamento de Backup" --info \
	    --text="Agendamento cancelado" \
	    --button="OK:0" --width=200
	exit 1
fi

HO=$(yad --title "Agendamento de backup" \
	 --text "Selecione a hora:" \
	 --entry \
	 --button="OK!gtk-ok:0" \
	 --width=300
)


if [ $? -ne 0 ]; then
	yad --title "Agendamento de Backup" --info \
		--text="Agendamento cancelado" \
		--button="OK!gtk-ok:0" --width=200
	exit 1
fi


DH=$(date -d "$DA $HO" +"%H:%M %Y-%m-%d")

echo "/home/ifpb/q2.sh" | at "$DH"

if [ $? -eq 0 ]; then
	yad --title "Agendamento de Backup" --info \
	    --text="Backup agendado para $HO em $DA" \
	    --button="OK:0" --width=300
else
	yad --title "Agendamento de Backup" --error \
	    --text="Erro" \
	    --button="OK:0" --width=200
fi

exit 0
