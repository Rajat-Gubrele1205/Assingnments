#! /bin/bash

echo "Enter file name : "
read file_name
cut -d " " -f 9 $file_name | grep "200" | wc -l
cut -d " " -f 9 $file_name
echo "Total no. of log responses :"
wc -l $file_name
