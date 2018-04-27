#!/bin/bash
#IgorAndrade Eitest Finder
#Version 1.1
#Run in a Screen for a better investigation
rm -rf /home/eitest.txt
while true
do
	#SpamHaus Honeypot, it will help us to find the account source
       hpot=$(echo 192.42.116.41)
	#it will get the info about the proccess, more details take a look on lsof manual
       lsof -Pni|grep $hpot
	#will enter on this if if the lsof command up is valid output matching with the ip of honeypot
	if [ $? -eq 0 ]
		then
			#it will get the pid proccess of attacker
			for saida in `lsof -Pni | grep $hpot | awk {'print $2'}`
			do 
			#it will give detailed where the file of attacker is and store it in a txt
			lsof -p $saida | egrep "cwd|DEL" | tee -a /home/eitest.txt
			done
			#just print at command line
			echo "The attacker was discovered take a look on: /home/eitest.txt"
		else
			#will keep investigate
			echo "Nothing Discovered yet..."
	fi
	sleep 1
done
