#!/bin/bash

ch5_1() {
    cmd1=([1]="ps" [2]="Display processes using the 'ps' command")
    cmd2=([1]="ps -A" [2]="Display ALL processes using the 'ps'")
    cmd3=([1]="ps -u root" [2]="Display processes using the 'ps' command just for the 'root' user ")
    cmd4=([1]="ps -F" [2]="Display processes using the 'ps' command with details and formated output")
    cmd5=([1]="pstree" [2]="Display process hierarhy using the 'pstree' command ")
    cmd6=([1]="top -bn 1 2>&1" [2]="Display processes in realtime using the 'top' command ")
    cmd7=([1]="ls /proc" [2]="Display the contents of the '/proc' file system ")
    cmd8=([1]="head /proc/cpuinfo" [2]="Display cpu from '/proc' ")
    cmd9=([1]="head /proc/meminfo" [2]="Display memory from '/proc' ")
    cmd10=([1]="tail /proc/partitions" [2]="Display partitions from '/proc' ")
    cmd11=([1]="cat /proc/uptime" [2]="Display uptime from '/proc' ")

    for i in $(seq 1 11); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done

}

ch5_2() {
    cmd1=([1]="sudo updatedb &" [2]="Run some processes in the background")
    cmd2=([1]="top &" [2]="Show the Linux processes")
    cmd3=([1]="jobs" [2]="Display current jobs")
    cmd4=([1]="sudo nohup updatedb &" [2]="Run a process as a daemon")
    cmd5=([1]="sudo ps ax" [2]="Display all processes")
    cmd6=([1]="kill -l" [2]="Display all 'kill' signals")
    
    for i in $(seq 1 6); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done

}

menu_ch5(){
    clear_screen
    echo "Chapter Five "
    echo -e "(a) Process information"
    echo -e "(b) Jobs, Daemons, Background processes & Signals"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch5(){
    echo -n "Please enter your choice: "
    read -r choice
    case $choice in
        "a"|"A"|"1")
            clear_screen
            ch5_1
            pause
            ;;

        "b"|"B"|"2")
            clear_screen
            ch5_2
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

ch5(){
    while true
	do
		menu_ch5
		read_opt_ch5
	done
}