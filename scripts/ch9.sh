ch9_1(){
    cmd1=([1]="netstat --tcp --listening" [2]="Services offered on the local machine")
    cmd2=([1]="telnet www.google.com 80" [2]="Telnet opens a connection to the pecified port and host")
    cmd3=([1]="ssh user@host" [2]="ssh is used to remotely connect to a machine")
    cmd4=([1]="hostname; pwd
ssh user@host \"hostname; pwd\"" [2]="ssh utilitary can also run commands remotely")    
   
    for i in $(seq 1 4); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done

}

ch9_2(){
    cmd1=([1]="scp myFile.exe user@host:~/work" [2]="scp utilitary to copy files from local machine to remote machine in the work folder")
    for i in $(seq 1 1); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch9_3(){
    cmd1=([1]="ssh-keygen -t rsa" [2]="ssh-keygen utilitary to generate a rsa key")
    cmd2=([1]="ssh-copy-id user@host" [2]="Copy the public key to the remote machine")
    for i in $(seq 1 2); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch9_4(){
    cmd1=([1]="wget -c https://google.ro \\&" [2]="Download a file through https")
    cmd2=([1]="wget --convert-links -r https://google.ro -o gnulog" [2]="Convert links transforms links from the site so that they can be viewed offline")
    cmd3=([1]="wget -r -1l www.google.ro" [2]="Downloads of all links with e depth of 1")
    for i in $(seq 1 3); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch9_5(){
    cmd1=([1]="curl \"http://www.cgi101.com/book/ch20/login.cgi?username=myUsername\"" [2]="Open a site with a specified username using curl")
    cmd2=([1]="curl -F upload@test01 -F press=OK test.cs.pub.ro/upload.cgi" [2]="Upload a file on a website using curl")
    cmd3=([1]="curl -A \"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.0)\" test.co" [2]="curl support for chaning identity")
    for i in $(seq 1 1); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
ch9_6(){
    cmd1=([1]="ftp ftp://anonymous:anonymous@speedtest.tele2.net" [2]="Connect to a ftp server with anonymous user and password")
    for i in $(seq 1 1); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}
menu_ch9(){
    clear_screen
    echo "Chapter Nine "
    echo -e "(a) Basic network commands"
    echo -e "(b) Transfer of files"
    echo -e "(c) SSH"
    echo -e "(d) Downloading of files"
    echo -e "(e) cURL scripting"
    echo -e "(e) File transfer protocol (ftp)"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch9(){
    echo -n "Please enter your choice: "
    read choice
    case $choice in 
        "a"|"A"|"1")
            clear_screen
            ch9_1
            pause
            ;;
        "b"|"B"|"2")
            clear_screen
            ch9_2
            pause
            ;;
        "c"|"C"|"3")
            clear_screen
            ch9_3
            pause
            ;;
        "d"|"D"|"4")
            clear_screen
            ch9_4
            pause
            ;;
        "e"|"E"|"5")
            clear_screen
            ch9_5
            pause
            ;;
        "f"|"F"|"6")
            clear_screen
            ch9_6
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

ch9(){
    while true
	do
		menu_ch9
		read_opt_ch9
	done
}