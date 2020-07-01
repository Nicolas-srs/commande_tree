#!/bin/bash
if [ $# -ne 0 ]
then
    chemin=$1 ; echo -e "tree $chemin\n"
else
    chemin="." ; echo -e "tree répertoire courant\n"
fi

function tree {
    for i in $(ls $1)
    do
        if [ $1 == $chemin ] #pas dans la récursivité, affichage normal
        then
            if [ -f $1/$i ]
            then
                echo "+-- $i"
            else
                echo "\-- $i"
                tree $1/$i
            fi
        else #drécursivité, affichage espacé
            nombre_tabulation=$(echo $1/$i | grep -o '/' | wc -l)
            if [ -f $1/$i ]
            then
                for ((j=2; j<$nombre_tabulation;j++))
                do
                    echo -en "\t"
                done
                echo -e "+-- $i"
            else
                for ((j=2; j<$nombre_tabulation;j++))
                do
                    echo -en "\t"
                done
                echo -e "\-- $i"
                tree $1/$i
            fi
        fi
    done
}

tree $chemin