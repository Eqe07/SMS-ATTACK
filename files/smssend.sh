#!/bin/bash
yeni_no=$(cat numara.txt)
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
eski_no=$(cat main.py |grep -o +[0-9]\* |sed -n 1p)
sed -ie "s/$eski_no/$yeni_no/g" main.py
rm main.pye
python3 main.py

