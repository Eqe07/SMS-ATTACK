#!/bin/bash
kontrol=$(which python3 |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m PYTHON KURULUYOR"
	echo
	echo
	echo
	pkg install python -y
fi
python3 -m pip install --upgrade pip
pip install colorama
pip install aiohttp
pip install BeautifulSoup

