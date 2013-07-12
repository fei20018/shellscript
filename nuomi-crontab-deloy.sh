#!/bin/sh
echo -e "pls choose action"\
         "\n[1] delpoy a new cron"\
         "\n[2] updata a cron"\
         "\n[3] delete a cron"
read act
case $act in
1)
	echo "you choose delpoy a new cron?[y/n]"
        read yorn
	echo $yorn
	if [[ $yorn -eq y ]]
	then
	/bin/sh src/deploy.sh
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
*)
	echo "sorry!input erro!";;
esac

