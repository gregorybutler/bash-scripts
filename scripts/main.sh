#!/bin/bash

trap '' SIGINT SIGQUIT SIGTSTP

source ./config.sh
source ./ch3.sh
source ./ch4.sh
source ./ch5.sh
source ./ch6.sh
source ./ch7.sh
source ./ch8.sh
source ./ch9.sh
#source ./ch10.sh
source ./ch11.sh
source ./ch12.sh

show_menus() {
	clear_screen
    echo "Main Menu:"
    echo -e "(a) Chapter  3 - Users and packages"
    echo -e "(b) Chapter  4 - File Systems"
    echo -e "(c) Chapter  5 - Processes"
    echo -e "(d) Chapter  6 - System boot & init" 
    echo -e "(e) Chapter  7 - Hardware analysis"
    echo -e "(f) Chapter  8 - Network config"
    echo -e "(g) Chapter  9 - Network services"
    echo -e "(h) Chapter 11 - Compiling & linking"
    echo -e "(i) Chapter 12 - More shell scripting?"
    echo -e "(y) Cleanup!"
    echo -e "(z) Exit"
    echo
}
read_options(){
	echo -n "Please enter your choice: " 
    read -r choice
	case $choice in
		"a"|"A"|"3") ch3 ;;
		"b"|"B"|"4") ch4 ;;
		"c"|"C"|"5") ch5 ;;
		"d"|"D"|"6") ch6 ;;
        "e"|"E"|"7") ch7 ;;
        "f"|"F"|"8") ch8 ;;
        "g"|"G"|"9") ch9 ;;
		"h"|"H"|"11") ch11 ;;
		"i"|"I"|"12") ch12 ;;
        "y"|"Y")
            clear_screen
            cleanup
            pause
            ;;
        "z"|"Z") 
            clear_screen
            cleanup
            clear_screen
            echo -e "${GREEN}Thank you for your time!${STD}"
            pause
            clear
            exit 0
            ;;

		*)
            echo -e "${RED}[${choice}]${STD} is not a valid option"
            pause
            clear_screen
            ;;
	esac
}
main_menu(){
	while true
	do
		show_menus
		read_options
	done
}
# Entry point
main_menu

