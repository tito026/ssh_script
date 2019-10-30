#!/bin/bash
while read  ipadd
do
#echo $ipadd
export ipadd
./find.sh $ipadd
done < ip-list
