#!/bin/bash

read -p "Install a package? (Y/N): " op

if [ "$op" = "Y" ] || [ "$op" = "y" ]; then
    read -p "Enter the package name: " package
    npm install "$package"
    ./dependencies.sh
else
    echo "Installation finished."
    exit 0
fi