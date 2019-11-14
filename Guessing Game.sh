#!/bin/bash
answer=$(($RANDOM%129))
declare -i guess
guess=129
declare -i score
score=0
until (($answer==$guess))
do
  read -p "Guess the number!(0-128) " guess
  score=score+1
  if (($guess>$answer))
  then
    echo "High guess"
  elif (($guess<$answer))
  then
    echo "Low guess"
  fi
done
echo "Congratulations, you guessed the correct number in "$score" tries"
read -p "Enter your name: " name
Score_File="scores.txt"
echo $name $score >> $Score_File
sort -k2 -n -o $Score_File $Score_File
echo "Top Scores: "
sed '1q;d' scores.txt
sed '2q;d' scores.txt
sed '3q;d' scores.txt