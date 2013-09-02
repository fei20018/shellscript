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
### svn up #########
cd /data/niux_static/assets/
/usr/bin/svn cleanup
static_ver=`/usr/bin/svn up|grep revision|awk -F'[ .]' '{print $3}'`
echo "static_ver="$static_ver
cd /data/nuomi/branches/prod/
/usr/bin/svn cleanup
web_ver=`/usr/bin/svn up|grep revision|awk -F'[ .]' '{print $3}'`
echo "web_ver="$web_ver
cd /data/nuomi/branches/prod/$1
if [[ $1 = "boa-server" ]]
then
/data/gradle-1.4/bin/gradle soascp
else
echo scp
/data/gradle-1.4/bin/gradle clean
/data/gradle-1.4/bin/gradle scp
fi
if [[ $? -eq 0 ]]
then
echo "upload done!version:"$1.${date}_pro_$web_ver
else
echo "upload fault!please check!"
fi
