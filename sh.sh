#!/bin/bash

while true; do
    for R in {0..255..15}; do
        for G in {0..255..15}; do
            for B in {0..255..15}; do
                echo -e "\033[38;2;${R};${G};${B}mСкрипт активен!\033[0m"
                sleep 0.1
                clear
            done
        done
    done
done
