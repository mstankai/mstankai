#!/bin/bash

# =====================
# created following
# https://linuxconfig.org/bash-scripting-tutorial
# =====================

# asking for user input 
echo -e "Enter a word: \c"
read word

# printing input
echo -e "\Your input was: \"$word\""

# asking for another input
echo -e "\nEnter TWO words: \c"
read word1 word2

# printing input
echo -e "Your input was: \"$word1\", \"$word2\""

# --------------------
# using default variable $REPLY

echo -e "\nHow are you?\n- \c"
read
echo -e "This was your reply: \"$REPLY\""


# --------------------
# storing replies in an array (using -a)

echo -e "\nWhat are your three favourite colours?"
read -a colours

echo -e "Your favourite colours are: \c"

for col in "${colours[@]}"; do echo -e "$col \c"; done
echo

