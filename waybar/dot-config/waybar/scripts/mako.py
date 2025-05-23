#!/usr/bin/env python3

import subprocess
import argparse

def makoctl_get_mode() -> str:
    return subprocess.check_output(["makoctl", "mode"], text=True).strip()

def makoctl_set_mode(mode: str):
    subprocess.run(["makoctl", "mode", "-s", mode], stdout=subprocess.DEVNULL)

def get_icon(state: str):
    if state == "do-not-disturb":
         return "🔔"
    elif state == "default":
         return "🔕"
    else:
         return "🚨"

def toggle_mode(mode: str):
    if mode == "do-not-disturb":
        makoctl_set_mode("default")
    else: 
        makoctl_set_mode("do-not-disturb")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("action", choices=["get-state", "toggle"], )

    args = parser.parse_args()

    if args.action == "get-state":
        print(get_icon(makoctl_get_mode())) 
    elif args.action == "toggle":
        toggle_mode(makoctl_get_mode())
    else:
        print("Unable to process input")

main()
