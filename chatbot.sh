# !/bin/bash

#title       : Exercise
#description : Exercice for students at Webstart
#author      : Saumurot Florian and Delbecq Thibaut
#date        :20161110
#version     : 0.1
#usage       :./chatbot.sh
#notes       : Only working on Unix machines
#=================================================

#droit réservé
echo "toute les phrase ayant une ressemblance et prenant des éléments"
echo "des jeux pokemon sont la propriétée de pokemon company"
echo ""
#introduction of bot
#module gestion for good intruction in function day moment
time=$(date +'%H')
if [ "$time" -gt "4" ] && [ "$time" -lt "12" ]
  then
    cat "ressources/presentation-1.txt"
    echo ""
    echo -n "??? : "
    read name
    echo "Name : $name" >> "ressources/user.txt"
    echo ""
elif [[ "$time" -lt "18" ]]
  then
    cat "ressources/presentation-2.txt"
    echo ""
    echo -n "??? : "
    read name
    echo "Name : $name" >> "ressources/user.txt"
    echo ""
else
    cat "ressources/presentation-3.txt"
    echo ""
    echo -n "??? : "
    read name
    echo "Name : $name" >> "ressources/user.txt"
    echo ""
fi #end of module

echo "Prof.Chen : Right ! So your name is $name !" #module choose your rival
cat "ressources/rival.txt"
echo ""
echo -n "$name : " #search the name of the user
read rival
echo "Rival name : $rival" >> "ressources/user.txt"
echo ""
cat "ressources/rival-2.txt"
echo "His name is $rival !"

for (( i=0;i <= 0;i++ ))
  do
    cat "ressources/first-pokemon.txt" #find the users pokémon with a choice into three pokémons and he show you the info of the pokémon.
    echo ""
    echo -n "$name : "
    read pokemon
    echo ""
    if [[ "$pokemon" == "Bulbasaur" ]]
      then
        echo "Pokemon : $pokemon" >> "ressources/user.txt"
        other-script/./bulbasaur.sh #
    elif [[ "$pokemon" == "Charmander" ]]
      then
        echo "Pokemon : $pokemon" >> "ressources/user.txt"
        other-script/./charmander.sh
    elif [[ "$pokemon" == "Squirtle" ]]
      then
        echo "Pokemon : $pokemon" >> "ressources/user.txt"
        other-script/./squirtle.sh
    else
        i=$(echo "$i - 1" | bc)
        echo "Prof.Chen : I don't know this pokemon" #answer if he don't find the pokémon
    fi
  done
echo "Prof.Chen : Do you want surname your pokemon ?(yes/no)" #rename the user pokémon. he check if yes you can continue
echo ""
echo -n "$name : "
read choice
echo ""
if [[ "$choice" == "yes" ]]
  then
    echo "What is here surname ?"
    echo ""
    echo -n "$name : "
    read pokemonsurname
    echo "Pokemon surname: $pokemonsurname" >> "ressources/user.txt" #save the surname of your pokémon
    echo ""
fi

echo "Prof.Chen : $name !"
cat "ressources/end.txt"
# end of introduction

while (true) #loop infite for emulation the conversation longer
  do
    cat "ressources/notice.txt"
    echo ""
    echo -n "$name : "
    read question
    echo ""
    if [[ $question == "exit" ]] #check if the user want quit or not
      then #yes bot say bye and force quit the script
        echo "Prof.Chen : Let's go $name, your adventures start !"
	rm "ressources/user.txt"
        exit 1
    elif [[ "$question" == "Do you remember me ?" ]]
      then
        echo "Prof.Chen : Yes of course !"
        cat "ressources/user.txt"
    else #no bot anwser at user question
        line=$(cat ressources/content.txt | grep -i "$question") #check if the question is in$
        if [[ "$line" == "" ]]
          then
            echo "Prof.Chen : I don't know this question"
        else
            nbline=${line:0:3} #save the first char of the question
            nxtline=$(echo "$nbline + 1" | bc) #calcul the anwser id
            anwser=$(cat ressources/content.txt | grep "$nxtline" | head -n 1) #search the anwser with$
            echo -n "Prof.Chen : "
            echo ${anwser:4} #show anwser starting after id
	    echo ""
            echo -n "$name : "
            read user_anser
            echo ""
	fi
    fi
  done

