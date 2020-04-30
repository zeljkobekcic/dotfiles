#!/usr/bin/python3
import os
import sys
from datetime import datetime
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('-f', '--filetype', type=str, default='md')
parser.add_argument('-p', '--prefix', type=str, default='session')
parser.add_argument('-s', '--suffix', type=str, default='notes')

args = parser.parse_args()

current_path = os.path.abspath(os.curdir)
date = datetime.now().strftime('%Y-%m-%d')
filename = '-'.join(
            filter(lambda x: x == '', 
            [args.prefix, date, args.suffix])
        ) + '.' + args.filetype

if  os.path.exists(filename):
    print("The file already exists!")
    sys.exit(1)
else:
    with open(filename, 'w') as outfile:
        outfile.write('')
    sys.exit(0)
