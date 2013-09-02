#!/bin/sh
date=date +%m%d%H%M
echo $task_sdir
### show all task program
echo  "all task as fllow:"
#allname=`/usr/bin/find  $task_sdir -type d -maxdepth 1`
allname=`/bin/ls  $task_sdir`
echo $allname
echo -e "==================\npls enter program name to be deloy:"
while read pname
do
if [[ -d $task_sdir/$pname  ]]
then
	echo ok
	/bin/tar -zcvf $pname-$date.tar.gz $task_sdir/$pname
	#scp
	/bin/tar -zxvf $pname-$date.tar.gz
	ln -s $pname $pname-$date
	echo "do you wantto start server?"
else
 echo no
	exit
fi
done


