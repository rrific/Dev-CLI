#!/bin/bash

case "$fn" in
    # Update and upgrade
    "system:update")
        echo -e "\n${WHITEBOLD}CLU – command line tools for developers\n"
        echo -e "====================================================${NC}\n"
        sudo apt-get update
        sudo apt-get -y upgrade
 ;;
esac

case "$fn" in
    # Update and upgrade linux generic etc
    "system:fullupdate")
        echo -e "\n${WHITEBOLD}CLU – command line tools for developers\n"
        echo -e "====================================================${NC}\n"
        sudo apt-get update
        sudo apt-get -y upgrade
        sudo apt-get -y upgrade linux-generic linux-headers-generic linux-image-generic
 ;;
esac
