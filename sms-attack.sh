#!/bin/bash

# CURL  PAKET KONTROLÜ #

if [[ ! -a $PREFIX/bin/curl ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi
if [[ $1 == update ]];then
	cd files
	bash update.sh update $2
	exit
fi
if [[ -a files/setup.sh ]];then
	bash files/setup.sh
	mv files/setup.sh files/.setup.sh
fi
clear
cd files
bash update.sh
if [[ -a ../updates_infos ]];then
	rm ../updates_infos
	exit
fi
if [[ $1 == "" || $1 == -h || $1 == --help ]];then
	clear
	bash banner.sh
	printf "\e[97m

	          +-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[1;33m
	                    |H|E|L|P|\e[0;97m
 	          +-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m


	\e[1;31m[ \e[1;4;97mSEÇENEKLER\e[0;1;31m ]\e[97m

	-n  --numara       \e[31m>>\e[32m NUMARA GİRİNİZ\e[97m

	-ms --moka_send    \e[31m>>\e[32m MOKA İLE RANDOM SMS GÖNDERTME\e[97m

	-m  --mesaj        \e[31m>>\e[32m BELİRLEDİĞİN BİR MESAJI GÖNDER\e[97m


	\e[31m[ \e[1;4;97mKULLANIM\e[0;1;31m ]\e[33m

	bash sms-attack.sh --numara +905555555555
	
	bash sms-attack.sh --numara +905555555555 --moka_send

	bash sms-attack.sh --numara +905555555555 --mesaj \"Merhaba Nasılsın\"
	"
	echo
	echo
	echo
	exit
fi
if [[ $1 == -n || $1 == --numara ]];then
	if [[ -n $2 ]];then
		kontrol=$(printf "$2" |grep -o +)
		if [[ $kontrol == + ]];then
			printf "$2" > numara.txt
			if [[ $3 == -ms || $3 == --moka_send ]];then
				bash moka_send.sh
			fi
			if [[ $3 == -m || $3 == --mesaj ]];then
				if [[ -n $4 ]];then
					clear
					bash banner.sh
					echo
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
					curl -s -X POST https://textbelt.com/text --data-urlencode phone="$(cat numara.txt)" --data-urlencode message="$4" -d key=textbelt > success
					control=$(cat success |grep -o false)
					if [[ -n $control ]];then
						control=$(cat success |grep -o "Test texts are temporarily disabled")
						if [[ -n $control ]];then
							echo
							echo
							echo
							printf "\e[33m
            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m

	    \e[31m[!]\e[97m ÖZEL SMS ATMA ÖZELLİĞİ SİTEDEN KAYNAKLI GEÇİCİ OLARAK DEVRE DIŞI.\e[33m.

            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m"
						       echo
						       echo
						       echo
						       rm success
						       exit
						fi
					fi
					control=$(cat success |grep -o false)
					if [[ -n $control ]];then
						control=$(cat success |grep -o "Only one test text message is allowed per day.")
						if [[ -n $control ]];then
							echo
							echo
							echo
							printf "\e[33m
            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m

	    \e[31m[!]\e[97m GÜNLÜK MESAJ GÖNDERME LİMİTİ BİTTİ
	    
	    \e[33m[*]\e[97m VPN KULLANARAK DENE HALA LİMİT BİTTİ DİYORSA
	    
	    EĞER BAŞKA NUMARA DENE.\e[33m.

            +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m"
						       echo
						       echo
						       echo
						       rm success
						       exit
						fi
					fi
					control=$(cat success |grep -o true)
					if [[ $control == true ]];then
						echo
						printf " \e[32m[✓]\e[97m MESAJ GÖNDERİLDİ \e[1;97m 
						$4\e[0m"
						echo
						rm success
						exit
					fi
				else
					echo
					echo
					echo
					printf "\e[31m[!]\e[97m MESAJ GİRİLMEDİ"
					echo
					echo
					echo
					exit
				fi
			else
				if [[ $3 == "" ]];then
					bash smssend.sh
					exit
				fi
				echo
				echo
				echo
				printf "\e[31m[!]\e[97m HATALI SEÇİM"
				echo
				echo
				echo
				exit
			fi
		else
			echo
			echo
			echo
			printf "\e[31m[!]\e[97m HATALI NUMARA GİRDİNİZ"
			echo
			echo
			echo
			exit
		fi
	else
		echo
		echo
		echo
		printf "\e[31m[!]\e[97m NUMARA GİRİLMEDİ"
		echo
		echo
		echo
		exit

	fi
else
	if [[ $1 == -h ]];then
		exit
	fi
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m HATALI SEÇİM"
	echo
	echo
	echo
	exit
fi
