#!/bin/bash
if [[ ! -a $PREFIX/bin/python ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m PYTHON KURULUYOR"
	echo
	echo
	echo
	pkg install python -y
fi
pip install -r requirements.txt
