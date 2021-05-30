#!/bin/bash
clear
bash banner.sh
progress () {
echo -ne "            \e[42;30mSending: [10%]\e[0;97m  [##.......................]\r"
sleep 2
echo -ne "            \e[42;30mSending: [25%]\e[0;97m  [#####....................]\r"
sleep 2
echo -ne "            \e[42;30mSending: [50%]\e[0;97m  [############.............]\r"
sleep 2
echo -ne "            \e[42;30mSending: [75%]\e[0;97m  [###################......]\r"
sleep 2
echo -ne "            \e[42;30mSending: [100%]\e[0;97m [#########################]\r"
echo -ne '\n'
}
echo
echo
echo
echo
echo
echo
progress
echo
echo
echo
echo
printf "\e[33m
            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m

               BAĞLANTIYI KESMEK İÇİN\e[31m >> \e[97m[\e[31m CTRL Z \e[97m]\e[33m

            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m"
echo
echo
echo
python main.py

