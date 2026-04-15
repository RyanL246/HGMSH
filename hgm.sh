#!/bin/bash

echo "*--- HANGMAN ---*"
read -s -p "Type Mystery Word" mystery
echo 

guesses=5
guessed=""

while (( guesses > 0 )); do
    echo "Guesses: $guesses"
    read -n 1 -p "Type guess: " guess
    echo

    if [[ $mystery == *"$guess"* ]]; then
        if [[ $guessed != *"$guess"* ]]; then
            guessed+=$guess
        fi

        echo "$guess was in the word!"

    else
        ((guesses--))
        echo "$guess was NOT in the word!"
    fi
done
