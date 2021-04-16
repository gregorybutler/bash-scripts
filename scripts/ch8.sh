ch8_1(){
    cmd1=([1]="ifconfig" [2]="ifconfig configures a temporary network interface")  
    cmd2=([1]="ifconfig -a" [2]="-a display information of existing interfaces")
    cmd3=([1]="ifconfig eth0" [2]="Display information about the eth0 interface")
    cmd4=([1]="ifconfig eth0 10.1.1.3" [2]="Configure the specified ip address on the eth0 interface")
    cmd5=([1]="ifconfig eth0 10.1.1.3 netmask 255.255.255.0" [2]="Configure ip with a netmask too")
    cmd6=([1]="route" [2]="View current routes")
    cmd7=([1]="route add default gateway 10.1.1.1" [2]="Configure a implicit route")
    cmd8=([1]="route -n" [2]="View routes in numeric format")
    cmd9=([1]="dhclient" [2]="Temporary DHCP configuration")
    for i in $(seq 1 9); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done

}

ch8_2(){
    cmd1=([1]="ifup -a" [2]="Activate all interfaces with auto in /etc/network/interfaces")
    cmd2=([1]="ifup eth0" [2]="Activate eth0 interface")
    cmd3=([1]="ifdown -a" [2]="Deactivate all active interfaces")
    cmd4=([1]="iface lo inet loopback" [2]="Specify a loopback  interface")
    cmd5=([1]="/etc/init.d/networking restart" [2]="After the interfaces file is modified you need to restart the networking service to read the new configuration")
    cmd6=([1]="/etc/init.d/networking stop" [2]="Stop the network service")
    cmd7=([1]="/etc/init.d/networking start" [2]="Start the network service")
    cmd7=([1]="iface eth0 inet dhop" [2]="Permanent DHCP configuration")
    for i in $(seq 1 7); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch8_3(){
    cmd1=([1]="resolvconf -d eth0" [2]="Delete an already present dns configuration")
    cmd2=([1]="host -t A google.ro" [2]="Get associated ip addres of domain")
    cmd3=([1]="host -t NS google.ro" [2]="Get the server associated with the domain")
    cmd4=([1]="host -t MX google.ro" [2]="Get the mail server associated with the domain")
    cmd5=([1]="host -t TXT google.ro" [2]="Description of the domain")
    for i in $(seq 1 5); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch8_4(){
    cmd1=([1]="hostname" [2]="Find out the machine name")
    cmd2=([1]="hostname myNewHostname" [2]="Change the mahone name")
    for i in $(seq 1 2); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch8_5(){
    cmd1=([1]="ping google.ro" [2]="Ping requests an answer from the target machine")
    cmd2=([1]="ping google.ro -c 3 -i 1" [2]="-c specified the number of packages to send and -i the interval in seconds between two packages")
    cmd3=([1]="ping google.ro -I eth0" [2]="-I specifies from which interface the packages will be sent")
    cmd4=([1]="ping -f google.ro" [2]="Unlimited package sending without waiting for an echo reply answer")
    cmd5=([1]="traceroute google.ro" [2]="Traceroute is used to test the path packages are following between source and destination")
    cmd5=([1]="traceroute -f 4 google.ro" [2]="The value of the starting message")
    cmd6=([1]="traceroute -m 3 google.ro" [2]="Maximum value of the traceroute")
    for i in $(seq 1 6); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch8_6(){
    cmd1=([1]="ethtool eth0" [2]="Ethtool offers detailed information about the type of the physical connection and its state")
    for i in $(seq 1 1); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
menu_ch8(){
    clear_screen
    echo "Chapter Eight "
    echo -e "(a) Temporary configurations"
    echo -e "(b) Permanent configurations"
    echo -e "(c) Domain Name Servers (DNS)"
    echo -e "(d) Aliases"
    echo -e "(e) Testing network configurations"
    echo -e "(f) Network troubleshooting"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch8(){
    echo -n "Please enter your choice: "
    read choice
    case $choice in 
        "a"|"A"|"1")
            clear_screen
            ch8_1
            pause
            ;;
        "b"|"B"|"2")
            clear_screen
            ch8_2
            pause
            ;;
        "c"|"C"|"3")
            clear_screen
            ch8_3
            pause
            ;;
        "d"|"D"|"4")
            clear_screen
            ch8_4
            pause
            ;;
        "e"|"E"|"5")
            clear_screen
            ch8_5
            pause
            ;;
        "f"|"F"|"6")
            clear_screen
            ch8_6
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

ch8(){
    while true
	do
		menu_ch8
		read_opt_ch8
	done
}