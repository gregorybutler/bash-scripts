#!/bin/bash

BLUE='\e[34m'
RED='\033[0;41;30m'
STD='\033[0;0;39m'
GREEN='\033[0;32m'

clear_screen() {
    clear && echo -en "\e[3J" # the second part is a fix for the console scroolbar
}

pause(){
    read -p "Press [Enter] key to continue..." pressEnterKey
}

clear_screen

run_command_prompt(){
    read -e -p "Run this command? [y/n/q] " YNQ
    if [[ {$YNQ,,} =~ "y" || $YNQ == "" ]]; then true return; else false return; fi;
    if [[ {$YNQ,,} =~ "q" ]]; then ${FUNCNAME[4]}; fi;
}

run_command(){
    cmd=$1
    desc=$2

    echo ""
    echo -e "COMMAND: ${BLUE}${cmd}
${GREEN}${desc}${STD}"
    if run_command_prompt == 1; then 
    echo -e "${BLUE}${cmd}${STD}"
    eval "${cmd}"
    echo ""
    echo -e "${GREEN}Done!${STD}"
    else clear_screen;fi
}

installed() {
    return "$(dpkg-query -W -f '${Status}\n' "${1}" 2>&1|awk '/ok installed/{print 0;exit}{print 1}')"
}

cleanup(){
    echo -e "${GREEN}Cleaning up...${STD}"
    pause
    [ -d dir1 ] && sudo rmdir dir1
    [ -f newfile.txt ] && sudo rm -f newfile.txt
    [ -f listare.txt ] && sudo rm -f listare.txt
    [ -f erori.txt ] && sudo rm -f erori.txt

    if grep -q "^testu:" /etc/passwd; then sudo deluser testu; fi
    if grep -q "^testgeorge:" /etc/passwd; then sudo deluser testgeorge; fi

    if grep -q "^testg:" /etc/group; then sudo delgroup testg; fi
    if grep -q "^teststudents:" /etc/group; then sudo delgroup teststudents; fi

    [ -d /home/testh ] && sudo rm -rf /home/testh
    [ -f new_archive.tar ] && sudo rm -f new_archive.tar
    [ -f new_gzip_archive.tar.gz ] && sudo rm -f new_gzip_archive.tar.gz
    [ -f fisier.txt ] && sudo rm -f fisier.txt
    [ -f ohup.out ] && sudo rm -f nohup.out
    
    [ -f mbr.bin ] && sudo rm -f mbr.bin
    [ -f partitions.backup ] && sudo rm -f partitions.backup

    installed hwinfo && sudo apt -y autoremove hwinfo
    installed smartmontools && sudo apt -y autoremove smartmontools

    [ -f /dev/loop99 ] && sudo umount /dev/loop99
    [ -f /dev/loop09 ] && sudo losetup -d /dev/loop99
    [ -f imagea998a9.img ] && sudo rm -f image.img
    [ -d /mnt/loop99 ] && sudo rmdir /mnt/loop99

    [ -f myCscript.c ] && sudo rm -f myCscript.c
    [ -f a.out ] && sudo rm -f a.out
    [ -f my_exec ] && sudo rm -f my_exec
    [ -f my_other_exec ] && sudo rm -f my_other_exec
    [ -f exec_multiple ] && sudo rm -f exec_multiple
    [ -f func.h ] && sudo rm -f func.h
    [ -f main.c ] && sudo rm -f main.c
    [ -f myCscript.c ] && sudo rm -f myCscript.c
    [ -f myCscript.o ] && sudo rm -f myCscript.o
    [ -f myCscript.s ] && sudo rm -f myCscript.s
    [ -f info.i ] && sudo rm -f info.i

    [ -f sum.c ] && sudo rm -f sum.c
    [ -f sumalt.c ] && sudo rm -f sumalt.c
    [ -f out.awk ] && sudo rm -f out.awk 
    [ -f out.txt ] && sudo rm -f out.txt
    [ -f out.sh ] && sudo rm -f out.sh
    [ -f hw.bash ] && sudo rm -f hw.bash
    [ -f new.bash ] && sudo rm -f new.bash
    [ -f bb-ssa-0 ] && sudo rm -f bb-ssa-*
    [ -f exec ] && sudo rm -f exec
    [ -f makefile ] && sudo rm -f makefile
    [ -f myPersonalMakeFileName ] && sudo rm -f myPersonalMakeFileName
    [ -f ptr ] && sudo rm -f ptr


    clear_screen
    echo -e "${GREEN}Done!${STD}"
}