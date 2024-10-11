#!/bin/bash


#------------------------------------Database-Functions-File-------------------------------
#functions: 1.create DB  2.list DB  3.connect DB  4.drop DB 

#-----------------Source-Section---------
source ./table-functions.sh

#-------------database-file-path---------
db_dir=" ./DBMS-project/databases"

#-------------database-menu--------------
database_options () {


        local db_name="$1"
    while true
    do
        echo "-----------------------------"
        echo "Database Menu for $db_name:"
        echo "1. Create Table"
        echo "2. List Tables"
        echo "3. Drop Table"
        echo "4. Insert into Table"
        echo "5. Select From Table"
        echo "6. Delete From Table"
        echo "7. Update Table"
        echo "8. Back to Main Menu"
	echo "-----------------------------"

        read -p "Enter your choice: " choice
	echo "-----------------------------"

        case $choice in

            1) create_table "$db_name"
                    ;;
            2) list_tables "$db_name"
                    ;;
            3) drop_table "$db_name"
                    ;;
            4) insert_into_table "$db_name"
                    ;;
            5) select_from_table "$db_name"
                    ;;
            6) delete_from_table "$db_name"
                    ;;
            7) update_table "$db_name"
                    ;;
            8) break
                    ;;
            *) echo "Invalid choice!"
                    ;;
        esac
    done
}

#------------create-database-function-------------
create_database () {

	read -p "please, Enter Database name: " db_name
	if [ -d "$db_dir/$db_name"  ]; then
		echo "-----------------------------"
		echo "Database name reserved, try another name"
	else
		mkdir -p "$db_dir/$db_name"
		echo "-----------------------------"
		echo "Database created successfully"
	fi

}

#------------list-database-function---------------
list_database () {

       echo "Databases: "
       ls -l "$db_dir"


}

#------------connect-database-function------------
connect_to_database () {

        read -p "please, Enter Database name: " db_name
        if [ -d "$db_dir/$db_name" ]; then
                database_options "$db_name"
        else
                echo "Database dosn't exist"
        fi


}

#------------drop-database-function---------------
drop_database () {

        read -p "please, Enter Database name: " db_name
        if [ -d "$db_dir/$db_name" ]; then
                rm -rf "$db_dir/$db_name"
                echo "Database dropped successfully"
        else
                echo "Database dosn't exist, enter the name correctly...."
        fi

}