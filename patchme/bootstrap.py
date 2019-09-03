#!/usr/local/bin/python3
import os
from pathlib import Path
import time
from subprocess import call
import requests
import tarfile

where_i_am_running = os.getcwd()

has_dpkg = Path("/usr/local/bin/dpkg")
is_not_brew = Path("/usr/local/var/lib/dpkg/status")


def check_dpkg():
    if has_dpkg == True and is_not_brew == True:
        print("DPKG is correctly installed, will check for boostrap now")
        check_boostrap()
    elif has_dpkg == True and is_not_brew == False:
        print("DPKG is installed in your system, sadly is from Brew, you need to unistall Brew to continue")
        print("Would you like to unistall Brew?")
        # Give them a couple of seconds to think if they really want to uninstall brew
        time.sleep(2)
        wants_brew = None
        while wants_brew not in ("Yes", "No"):
            wants_brew = input("Please reply yes or no: ")
            if wants_brew == "Yes":
                call(
                    ["ruby -e ,""$(curl - fsSL https: // raw.githubusercontent.com/Homebrew/install/master/uninstall)"])
                print("Brew is now gone from your system, will check for boostrap now")
                check_boostrap()
            elif wants_brew == "No":
                print(
                    "Sorry, you cant build MacPT and have brew installed in your system, have a good day")
                exit()
            else:
                print("Plase input yes or no")
    elif has_dpkg == False and is_not_brew == False:
        request_dpkg = None
        print("No DPKG was detected in your system ")
        print("Would you like to install dpkg?")
        install_dpkg = None
        while install_dpkg not in ("Yes", "No"):
            install_dpkg = input("Please reply yes or no: ")
            if install_dpkg == "Yes":
                request_dpkg = requests.get(
                    "https://raw.githack.com/Official-polar-team/Mac-APT-Installer/master/dpkg.tar.gz")
            os.makedirs(where_i_am_running + "dpkg/usr/local")
            request_dpkg.extractall()
            os.makedirs(where_i_am_running + "dpkg/usr/local")

            os.rename(where_i_am_running + "")


def check_boostrap():
    print("Bruh")
