#!/bin/bash
fichier=results.csv
if [ -f $fichier ]
then
    rm -f $fichier
fi
for server in 41.226.22.50 41.226.16.50
do
    for domain in www.google.fr www.ati.tn www.yahoo.com www.wikipedia.org www.topnet.tn www.free.fr www.gnet.tn www.orange.fr
    do
        i=1
        while ((i<7))
        do 
            echo -e -n "$i\t$server\t">>$fichier
            echo -n `dig @$server $domain +time=1|grep "Query time"|cut -d " " -f4`>>$fichier
            echo -e "\t$domain">>$fichier
            i=$(expr 1 + $i)
        done
    done
done
