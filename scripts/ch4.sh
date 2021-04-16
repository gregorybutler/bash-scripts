#!/bin/bash

source ./config.sh

ch4_1() {
    cmd1=([1]="pwd" [2]="Print the working directory...")
    cmd2=([1]="touch file1.txt" [2]="Create a file...")
    cmd3=([1]="ls -al" [2]="List files...")
    cmd4=([1]="cp file1.txt file2.txt" [2]="Copy file...")
    cmd5=([1]="rm file1.txt" [2]="Delete file...")
    cmd6=([1]="mv file2.txt newfile.txt" [2]="Rename file...")
    cmd7=([1]="mkdir dir1 dir2 dir3" [2]="Create directory...")
    cmd8=([1]="rmdir dir2" [2]="Delete empty dir...")
    cmd9=([1]="touch dir3/test1.txt dir3/test2.txt; ls -a ~/ > dir3/test3.txt" [2]="Create files using relative path...")
    cmd10=([1]="ls -lR" [2]="List dir contents recursive...")
    cmd11=([1]="rm -rf dir3" [2]="Delete dir recursive...")
    cmd12=([1]="sudo tar cvf new_archive.tar /etc" [2]="Archive files with 'tar'")
    cmd13=([1]="sudo tar czvf new_gzip_archive.tar.gz /etc" [2]="Archive files with 'tar' and compressed with 'gzip'")

    for i in $(seq 1 13); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
    
}
ch4_2(){
    list_file="listare.txt"
    error_file="erori.txt"
    cmd1=([1]="ls > $list_file" [2]="Output 'ls' result to file...")
    cmd2=([1]="cat $list_file" [2]="Display ${list_file} using 'cat' command")
    cmd3=([1]="date >> $list_file" [2]="Add 'data' command output at the end of ${list_file}")
    cmd4=([1]="cat $list_file" [2]="Display ${list_file} using 'cat' command")
    cmd5=([1]="cp $list_file 2> $error_file" [2]="Store error of 'cp' command to ${error_file}")
    cmd6=([1]="ls fisier1.txt fisier4.txt 2>&1 > $list_file" [2]="Store the result and errors of 'ls' command to ${list_file}")
    cmd7=([1]="cat $list_file" [2]="Display contents of ${list_file} using 'cat' command")

    for i in $(seq 1 7); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done

}

ch4_3() {
    cmd1=([1]="touch fisier.txt" [2]="Create a new file called fisier.txt to inspect rights")
    cmd2=([1]="ls -l fisier.txt" [2]="List files with details")
    cmd3=([1]="chmod 777 fisier.txt" [2]="Set access rights to 777")
    cmd4=([1]="ls -l fisier.txt" [2]="List files with details")
    cmd5=([1]="chmod u=rwx,g=r,o=- fisier.txt" [2]="Set access rights using literal form")
    cmd6=([1]="ls -l fisier.txt" [2]="List files with details")

    for i in $(seq 1 6); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done

}

ch4_4() {
    cmd1=([1]="sudo find /home -name .bashrc" [2]="Find files matching '.bashrc' in the /home ")
    cmd2=([1]="sudo find /usr -size +500k" [2]="Find files larger '+500k' in the /usr ")
    cmd3=([1]="locate pwd" [2]="Find files containing 'pwd' using the 'locate' command ")
    cmd4=([1]="whereis ls" [2]="Find 'ls' using the 'whereis' command ")
    cmd5=([1]="which bash" [2]="Find the path of 'bash' using the 'which' command ")
    cmd6=([1]="type cd; type cat" [2]="Determien if 'cd/cat' is a builtin/external/allias command ")
    cmd7=([1]="file /bin/id" [2]="Find the file type of '/bin/id' using the 'file' command ")

    for i in $(seq 1 7); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
    
}

ch4_5() {
    loopdev="loop99"
    image="imagea998a9.img"
    cmd1=([1]="mount | more" [2]="Display mounted file systems")
    cmd2=([1]="sudo cat /etc/mtab | more" [2]="Display mounted file systems at system startup")
    cmd3=([1]="sudo dd if=/dev/zero of=$image iflag=fullblock bs=1M count=500 && sync" [2]="Create and empty disk image ")
    cmd4=([1]="sudo sudo losetup $loopdev $image" [2]="Create a loop device with the newly created disk image as /dev/${loopdev} ")
    cmd5=([1]="sudo parted --script /dev/${loopdev} \
mklabel gpt \
mkpart primary ext4 1MiB 500MB" [2]="Create a new GPT partition table on /dev/${loopdev} using 'parted' command and a EXT4 partition using the whole disk space")
    cmd6=([1]="sudo mkfs -t ext4 /dev/${loopdev}p1" [2]="Format the newly created partition /dev/${loopdev}p1 using the 'mkfs' command ")
    cmd7=([1]="sudo mkdir -p /mnt/loop9; sudo mount /dev/${loopdev}p1 /mnt/loop9" [2]="We will mount /dev/${loopdev}p1 to /mnt/${loopdev} ")
    cmd8=([1]="mount | grep ${loopdev}" [2]="Display mounted file system")
    cmd9=([1]="df -h | grep ^/dev" [2]="Display disk utilisation")
    cmd10=([1]="sudo umount /dev/${loopdev}p1
sudo fsck -t ext4 /dev/${loopdev}p1" [2]="To check the filesystem for errors we need to firstly unmount it then run the 'fsck' command against it ")
    cmd11=([1]="sudo umount /dev/${loopdev} ; sudo losetup -d /dev/${loopdev} ; sudo -f rm ${image} ; sudo rmdir /mnt/${loopdev}" [2]="Cleaning up...")

    for i in $(seq 1 11); do
        cmd=cmd$i[1]
        desc=cmd$i[2]
        run_command "${!cmd}" "${!desc}"
    done
}

menu_ch4(){
    clear_screen
    echo "Chapter Four - File Systems "
    echo -e "(a) Working with files"
    echo -e "(b) Output redirection"
    echo -e "(c) Access rights"
    echo -e "(d) Find files"
    echo -e "(e) Drives and mounts"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch4(){
    echo -n "Please enter your choice: "
    read -r choice
    case $choice in 
        "a"|"A"|"1")
            clear_screen
            ch4_1
            pause
            ;;

        "b"|"B"|"2")
            clear_screen
            ch4_2
            pause
            ;;

        "c"|"C"|"3")
            clear_screen
            ch4_3
            pause
            ;;

        "d"|"D"|"4")
            clear_screen
            ch4_4
            pause
            ;;

        "e"|"E"|"5")
            clear_screen
            ch4_5
            pause
            ;;

        "x"|"X"|"0")
            clear_screen
            main_menu
            ;;

            *)
            echo -e "${RED}[${choice}]${STD} is not a valid option"
            pause
            ;;
    esac
}

ch4(){
    while true
	do
		menu_ch4
		read_opt_ch4
	done
}