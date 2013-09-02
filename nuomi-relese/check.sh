#!/bin/bash
date=`date +%Y%m%d`
###check $1 is a dirctory####
cd /data/nuomi/branches/prod/
if [[ -d $1 ]]
then
echo "program name: "$1" right!"
else
echo "dirctory:$1 no found!please check!"
exit
fi
###
eval `head /data/nuomi/branches/prod/$1/build.gradle | grep -v '\/\/'| grep servers|sed -e 's/\[/\(/g' -e  's/\]/\)/g' -e 's/,/ /g'  -e's/ = /=/g'`
for i in ${servers[*]}
do
echo 'root@'$i''
ssh root@$i "cat /opt/nginx_inner/conf/nginx.conf|grep 127.0.0.1;exit"
done
