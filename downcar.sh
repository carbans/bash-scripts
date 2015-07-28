#!/bin/bash

####################################################################################################
##Autor: Carlos Latorre Sánchez																	 ###
##Email: carlos.latorre.sanchez at gmail.com													 ###
##Version: v1																					 ###
##Nombre: pruebas																				 ###
##Licencia: 																					 ###
##																								 ###
####################################################################################################

################# VARIABLES GLOBALES ###################################
nombre_programa="DownCar"
version="v1"
fecha=$(date +"%s_%m_%d_%Y")
video=$2


################## ERRORES ############################################
error1="Error: Tiene que añadir algún parámetro"
error2="Demasiados parámetros"

function muestraayuda(){
echo -e "$nombre_programa - $version"
        echo -e "-h  --help\t\t Muestra esta ayuda."
        echo -e "-v  --version\t\t Muestra la versión."
        echo -e "-u  --update\t\t Actualiza el programa."
        echo -e "-y  --youtube\t Permite añadir la URL del video para su descarga"
        echo -e "-ya  --youtube-audio\t Añade la URL del video y te lo convierte en audio mp3"
}

function muestraayudareducida(){
        echo -e "-h --help\t\t Muestra la ayuda."
        echo -e "-v --version\t\t Muestra la versión."
}

#Comprobamos los parámetros que han introducido
if [ "$#" -eq 0 ]; #Si son cero se le muestra una ayuda reducida
then
echo -e "error1"
muestraayudareducida
fi


if [ "$#" -eq 1 ]; #Si hay un parámetro evaluamos cúal es para que se encargue cada if
then
	if [ "$1" == "-h" ] || [ "$1" == "--help" ];
	then
	muestraayuda
	fi

	if [ "$1" == "-v" ] || [ "$1" == "--version" ];
	then
	echo -e "$nombre_programa" " $version"
	fi

    if [ "$1" == "-y" ] || [ "$1" == "--youtube" ];
    then
    echo -e "Buscando el video seleccionado"
    youtube-dl $video
    fi
    
    if [ "$1" == "-u" ] || [ "$1" == "--update" ];
    then
    echo -e "Buscando actualizaciones disponibles"
    wget http://github.com/carbans/utils/huella.txt
    
    
    ffmpeg -b 192k -i