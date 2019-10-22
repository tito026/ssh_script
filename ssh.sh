#!/bin/bash
while read  ipadd
do
#echo $ipadd
export ipadd
./find_mac.sh $ipadd
done < ip-list
