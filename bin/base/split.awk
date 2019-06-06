#!/usr/bin/env awk -f

echo $@
echo 'split'

file=$1
sep=$2

if [ $sep == "-d" ]
then
    echo 's'
    d=`date '+%Y-%m-%d'`
    echo $d
    # echo $(awk '/$d 00/ {print $0}' $file)
    cmd="awk '"
    cmd=${cmd}"/$d/ {print \$0}"
    cmd=${cmd}"' $file"
    echo $cmd
    `$cmd`
fi


