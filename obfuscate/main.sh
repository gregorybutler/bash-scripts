#!/bin/bash
trap '' SIGINT SIGQUIT SIGTSTP
source <(base64 -d main)
main_menu
