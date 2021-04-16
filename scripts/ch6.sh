#!/bin/bash

ch6_1(){
    cmd1=([1]="[ -b /dev/sda ] && sudo dd if=/dev/sda of=mbr.bin count=8" [2]="Copy the fist 8 sectors of /dev/sda to mbr.bin")
    cmd2=([1]="hexdump mbr.bin | tail" [2]="Display the contents off mbr.bin in hexazecimal format")
    cmd3=([1]="sudo sfdisk -d /dev/sda > partitions.backup" [2]="Backup the partitions table to a file")
    cmd4=([1]="cat partitions.backup" [2]="Display the contents of the backup file")
     
    for i in $(seq 1 4); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

ch6_2(){
    
    cmd1=([1]="sudo runlevel" [2]="Display current runlevel as root")
    cmd2=([1]="who -r" [2]="Display current runlevel as current user")
    
    for i in $(seq 1 2); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

ch6_3(){
    
    cmd1=([1]="sudo getty -" [2]="opens a tty port, prompts for a login name and invokes the /bin/login command")
    
    for i in $(seq 1 1); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}


menu_ch6(){
    clear_screen
    echo "Chapter Six "
    echo -e "(a) Partition table"
    echo -e "(b) Runlevels"
    echo -e "(c) getty & login" 
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch6(){
    echo -n "Please enter your choice: "
    read -r choice
    case $choice in
        "a"|"A"|"1")
            clear_screen
            ch6_1
            pause
            ;;

        "b"|"B"|"2")
            clear_screen
            ch6_2
            pause
            ;;
        
        "c"|"C"|"3")
            clear_screen
            ch6_3
            pause
            ;;

        "x"|"X")
            clear_screen
            main_menu
            ;;
        *)
            echo -e "${RED}[${choice}]${STD} is not a valid option"
            pause
            ;;
    esac
}

ch6(){
    while true
	do
		menu_ch6
		read_opt_ch6
	done
}