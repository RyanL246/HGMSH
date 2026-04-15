#!/bin/bash

echo "*--- HANGMAN ---*"
read -s -p "Type Mystery Word" mystery
echo 

guesses=5
guessed=""
masked=""

for (( i=0; i<${#mystery}; i++ )); do
    masked+="_"
done

while [[ guesses > 0 ]]; do
    echo "-----------------"
    echo "Guesses: $guesses"
    echo "$masked"
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

    # Win condition - no underscores in masked word
    if [[ $masked != *"_"* ]]; then
        echo
        echo "Congratulations! You have guessed the word: $mystery."
        exit 0
    fi
done

# Lose game if gueeses run out
echo
echo "GAME OVER! - All guesses have been exhausted, The word was: $mystery."
