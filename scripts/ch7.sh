#!/bin/bash

ch7_1(){
    cmd1=([1]="lsmod | tail" [2]="Show the status of modules in the Linux Kernel")
    cmd2=([1]="cat /proc/modules | tail" [2]="List modules in /proc/modules")
    cmd3=([1]="uname -r" [2]="Get name and information about current kernel")
    cmd4=([1]="sudo insmod /lib/modules/$(uname -r)/kernel/drivers/input/misc/pcspkr.ko" [2]="Insert a module 'pcspkr' into the Linux Kernel")
    cmd5=([1]="sudo rmmod pcspkr" [2]="Remove a module 'pcspkr' from the Linux Kernel")
    cmd6=([1]="lsmod | grep pcspkr" [2]="Show status of 'pcspkr' kernel module")
     
    for i in $(seq 1 6); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

ch7_2(){
    
    cmd1=([1]="lsusb" [2]="List USB devices conected tot the system")
    cmd2=([1]="lspci" [2]="List PCI devices conected tot the system")
    cmd3=([1]="sudo apt -y install hwinfo; hwinfo --short | tail -n 15" [2]="Show info about hardware installed in the system")
    cmd4=([1]="hwinfo --cpu" [2]="Use 'hwinfo' command to display info only about cpu")
    cmd5=([1]="sudo apt -y install smartmontools; smartctl -all /dev/sda" [2]="Display SMART informationf for /dev/sda")
    cmd6=([1]="sudo file /dev/tty0 /dev/ttyS0 /dev/sda /dev/sda1 /dev/loop /dev/ram0 /dev/null /dev/zero /dev/urandom" [2]="Display device types")
    cmd7=([1]="cat /proc/interrupts" [2]="Display details about hardware interrupts")
    cmd8=([1]="cat /proc/ioports" [2]="Display I/O ports found on the system")  
     
    for i in $(seq 1 8); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

ch7_3(){
    
    cmd1=([1]="cat /proc/cpuinfo | head -n 15" [2]="Display info about the CPU installed on the system")
    cmd2=([1]="cat /proc/meminfo" [2]="Display info about the memory used by the system")
    cmd3=([1]="cat /proc/version" [2]="Display the version of Linux Kernel, gcc compiler and Linux distribution")
    cmd4=([1]="cat /proc/uptime" [2]="Display the time since the system was booted in epoch format ")
      
    for i in $(seq 1 4); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}


menu_ch7(){
    clear_screen
    echo "Chapter Seven "
    echo -e "(a) Kernel modules(drivers)"
    echo -e "(b) Hardware analysis"
    echo -e "(c) System information" 
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch7(){
    echo -n "Please enter your choice: "
    read -r choice
    case $choice in
        "a"|"A"|"1")
            clear_screen
            ch7_1
            pause
            ;;

        "b"|"B"|"2")
            clear_screen
            ch7_2
            pause
            ;;
        
        "c"|"C"|"3")
            clear_screen
            ch7_3
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

ch7(){
    while true
	do
		menu_ch7
		read_opt_ch7
	done
}