#!/bin/bash
while read  ipadd
do
#echo $ipadd
export ipadd
./enableint.sh $ipadd
done < IP-list 
