characters=("RICK" "MORTY" "SUMMER" "JERRY" "MR POOPYBUTTHOLE" "BIRD PERSON")

aliens=("MR POOPYBUTTHOLE" "BIRD PERSON")

idiots=("MORTY" "JERRY")

for char in "${characters[@]}"
do 
    check=false;
    
    for alien in "${aliens[@]}"
    do 
        [ "${char}" == "${alien}" ] && check=true
    done

    [ "$check" == true ] && echo "Alien -->" ${char} && check=false || echo "Human -->" ${char}

done

