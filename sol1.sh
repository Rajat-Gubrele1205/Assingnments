#! /bin/bash

echo "Enter file name : "
read file_name
awk '{print $9}' $file_name | grep "200" | wc -l
awk '{ print $9 }' $file_name
echo "Total no. of log responses :"
wc -l $file_name
