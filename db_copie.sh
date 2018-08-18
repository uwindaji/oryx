#!/bin/sh

value='app.sql';
val=`cat app.sql | tr '\n' '^' | tr '\t' ','`

nomTable=""
numeroTable=0
champTable=""
numeroKeys=0

#function to extraire keys
keys () {

    set -f
    champTable="${champTable//,/ }"
    array=($(echo $champTable))
    nomTable="${nomTable//(/}"
    echo "$nomTable"
    for i in "${array[@]}"
    do
        a="${i//^/ }"
        a=($(echo $a))
        if [ ${a[0]} == "CONSTRAINT" ];
        then
            echo "${a[1]}"
        else

            echo "${a[0]}" # recuper la clé
        fi
    done

    echo "============= fin"
    numeroTable=$(($numeroTable+1))
    baseName
}
# function to extraire table
table () {

    # s1 = les table
    tableSpace="${val// /ù}"
    keySpace=($(echo $tableSpace | tr -s ',' ","))
    keyConf="${keySpace//^/}"
    keyConf="${keyConf//#/}"
    keyConf="${keyConf//-/ }"
    kf="${keyConf//ù/ }"
    # $2 nom de la table
    foo="$kf"
    foo=${foo##*$nomTable }
    foo=${foo%% )ENGINE=InnoDB;*}
    foo="${foo// /ù}"
    set -f
    foo="${foo//)ENGINE=InnoDB;/ }"
    a=($(echo $foo))
    #echo "2 => ${a[0]}" # recuper la clé
    lacle="${a[0]//ù/^}"

    #echo "$lacle ===========> version(1)"
    a=($(echo $lacle))
    
    champTable=${a[0]}
    keys
    #champTable=$(($champTable+1))
}


# function to extraire name of table
baseName (){

    foo="${val//CREATE TABLE/ }"
    tr=$(grep -w $value -e 'CREATE TABLE') # cherhce dans le fichier le mot CREATE TABLE
    temp=${tr#*"CREATE TABLE"} # affiche les mot qui se trouve apres CREATE TABLE
    tab="${temp//CREATE TABLE}" # suprimmer le charachtere '('
    set -f 
    array=(${tab// / })
    
    if [ $numeroTable -eq ${#array[@]} ];
    then
        echo 'table extraire'
    elif [ $numeroTable -lt ${#array[@]} ];
    then

        nomTable="${array[$numeroTable]}"
        table 
    fi

}
baseName 