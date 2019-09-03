#!/usr/local/bin/python3


def main():
    print("Hello! Welcome to APaTcher.")
    print("Licensed under GPL2. By Polar Development")

    print("")
    print("What do you want to do today?:")
    print("1.Bootstrap your system")
    print("2.Build MacPT (Also patches)")
    print("3.Pack boostrap (Split)")
    print("4.Pack APT only (Split)")
    print("")

    ask_what_to_do = input("Please select what you want: ")
    what_user_wants = None

    while what_user_wants not in (1, 2, 3, 4):
        what_user_wants = int(ask_what_to_do)
        if what_user_wants == 1:
            print("Selected 1")
            break
        elif what_user_wants == 2:
            print("Selected 2")
            break
        elif what_user_wants == 3:
            print("Selected 3")
            break
        elif what_user_wants == 4:
            print("Selected 4")
            break
        else:
            print("Please select a valid option!")
            break

main()
