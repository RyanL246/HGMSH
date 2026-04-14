#!/bin/bash

echo "*--- HANGMAN ---*"
read -s -p "Type Mystery Word" mystery
echo 

guesses=5

while (( guesses > 0 )); do
    echo "Guesses: $guesses"
    read -n 1 -p "Type guess: " guess
    echo

    ((guesses--))
done
