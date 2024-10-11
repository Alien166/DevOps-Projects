#!/bin/bash

#-------Intialization-message-------
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
blue="\033[0;34m"
reset="\033[0m" 


bar=""
for ((i=0; i<50; i++)); do
    bar+="\u2500"
done

# Print 
echo -e "$bar\u252c$bar\u2500\u2500"
echo -e "${green}                                          Database${green} Beta${green} Version${reset}"
echo -e "$bar\u2534$bar\u2500\u2500"




#--------------------------sourcing-section-----------------------------------
source ./db-functions.sh
source ./table-functions.sh

#------------------------main-function-section--------------------------------
while  true 
do

	echo "-----------Options-----------"
	echo "1.Create Database"
	echo "2.List Databases"
	echo "3.connect to Database"
	echo "4.Drop Database"
	echo "5.Exit"
        echo "-----------------------------"

read -p "please, Enter your choice: " choice
echo "-----------------------------"


case $choice in
	1) create_database
	       	;;
        2) list_database
	       	;;
        3) connect_to_database
	       	;;
        4) drop_database
	       	;;
        5) exit 0  
	       	;;
        *) echo "Invalid Input, Try Again...."
	       	;;
esac

done