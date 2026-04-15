#!/bin/bash

echo "*--- HANGMAN ---*"
read -s -p "Type Mystery Word" mystery
echo 

guesses=5
guessed=""

while (( guesses > 0 )); do
    echo "-----------------"
    echo "Guesses: $guesses"
    read -n 1 -p "Type guess: " guess

    if [[ $mystery == *"$guess"* ]]; then
        if [[ $guessed != *"$guess"* ]]; then
            guessed+=$guess
        fi

        echo " - \"$guess\" was in the word!"

    else
        ((guesses--))
        echo " - \"$guess\" was NOT in the word."
    fi

    masked=""

    # Mask mystery word with underscores
    for (( i=0; i<${#mystery}; i++ )); do
        c=${mystery:i:1}

        if [[ $guessed == *"$c"* ]]; then
            masked+=$c
        else
            masked+="_"
        fi
    done

    echo "$masked"
done
