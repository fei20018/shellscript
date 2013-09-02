#!/bin/sh
##variable
task_sdir=/opt/task

function prompt1
{
echo -e "pls choose action"\
         "\n\t[1] delpoy a new cron"\
         "\n\t[2] updata a cron"\
         "\n\t[3] delete a cron"\
         "\n\t[q] quit"
}
### main ##
prompt1
while read act
do
if [[ $act -eq 1 ||  $act -eq 2 ||  $act -eq 3 ||  $act -eq "q" ]]
then
	break
else
	echo "sorry!input erro!"
	prompt1
fi
done
case $act in
1)
	echo "you choose delpoy a new cron?[y/n]"
        read yorn
	echo $yorn
	if [[ $yorn -eq y ]]
	then
	source src/deploy.sh
	else
	exit 0
	fi	


;;
2)
	echo "you choose updata a cron?[y/n]"
        read yorn
	echo $yorn
	if [[ $yorn -eq y ]]
	then
	/bin/sh src/updata.sh
	else
	exit 0
	fi	

;;
3)
	echo "you choose delete a cron?[y/n]"
        read yorn
	echo $yorn

	if [[ $yorn -eq y ]]
	then
	/bin/sh src/delete.sh
	else
	exit 0
	fi	
;;
q)
	exit 0
;;
*)
	echo "sorry!input erro!"
;;
esac

