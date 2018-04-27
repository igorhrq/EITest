## EITest Finder Attacker
#### Version 1.1

This script will find the all evidences necessary to take the attacker of EITest(botnet activities):


- The log will been stored at /home/eitest.txt
- The script will keep recording till the proccess of activity is gone
- the motor of scripts uses lsof command

###Example:

- Open a screen for a better investigation
- Run The Script 
- leave from the screen and put a follow up

The script will work something like this:

#####When not get any activitie:

```
root@server6 [~]# bash -x bash.sh 
+ true
++ echo 192.42.116.41
+ hpot=192.42.116.41
+ lsof -Pni
+ grep 192.42.116.41
+ '[' 1 -eq 0 ']'
+ echo 'Nothing Discovered yet...'
```
