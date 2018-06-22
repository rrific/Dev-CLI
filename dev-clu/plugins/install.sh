#!/usr/bin/env bash

case "$fn" in
    # Create a new user (find another way to execute this safely
    "install")
        echo -e "${LIGHTBLUE}Will install in your /usr/local/sbin ${NC}";
        read -p 'Do you agree ? (ENTER) : ' REPLY
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
          sudo cp clu /usr/local/sbin/.
          sudo cp -r dev-clu /usr/local/sbin/.
        fi
    ;;
esac
