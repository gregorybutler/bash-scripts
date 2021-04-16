#!/bin/bash

ch3_1() {

    cmd1=([1]="cat /etc/passwd" [2]="List passwd contents...")
    cmd2=([1]="sudo cat /etc/shadow" [2]="List shadow contents...(requires elevation)")
    cmd3=([1]="id $USER" [2]="Get infor about current user...")
    cmd4=([1]="sudo adduser testgeorge" [2]="Add a new user called 'testgeorge'")
    cmd5=([1]="sudo deluser testgeorge" [2]="Delete the previously created user 'testgeorge'")
    cmd6=([1]="sudo addgroup teststudents" [2]="Create a new user group called 'teststudents'")
    cmd7=([1]="sudo delgroup teststudents" [2]="Delete the previously created group 'teststudents'")
    cmd8=([1]="sudo groupadd testg; sudo useradd --home /home/testh -m -g testg --comment \"Test\" testu" [2]="Create a new user 'testu' having the new group 'testg' and\nthe home '/home/testh'")
    cmd9=([1]="echo testu:testp1234 | sudo chpasswd" [2]="Set the password for the new user 'testu'")

    for i in $(seq 1 9); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

ch3_2() {
    cmd1=([1]="sudo dpkg -L coreutils | tail" [2]="List the content of the package coreutils ")
    cmd2=([1]="sudo dpkg -S /bin/ps" [2]="Find the package that contains the file /bin/ps ")
    cmd3=([1]="sudo apt install gddrescue" [2]="Install the package gddrescue ")
    cmd4=([1]="sudo apt remove gddrescue" [2]="Remove the package gddrescue ")
    cmd5=([1]="sudo apt clean" [2]="Clean the local cache... ")
    cmd6=([1]="sudo apt update" [2]="Update the package list... ")
    cmd7=([1]="sudo apt upgrade" [2]="Download and install the available updates... ")
    cmd8=([1]="sudo apt autoremove" [2]="Remove unneeded packages... ")

    for i in $(seq 1 8); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

menu_ch3(){
    clear_screen
    echo "Chapter Three "
    echo -e "(a) Users and group management"
    echo -e "(b) Package management"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch3(){
    echo -n "Please enter your choice: "
    read -r choice
    case $choice in 
        "a"|"A"|"1")
            clear_screen
            ch3_1
            pause
            ;;
        "b"|"B"|"2")
            clear_screen
            ch3_2
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

ch3(){
    while true
	do
		menu_ch3
		read_opt_ch3
	done
}