## EITest Finder Attacker
#### Version 1.1

This script will find the all evidences necessary to take the attacker of EITest(botnet activities):


- The log will been stored at /home/eitest.txt
- The script will keep recording till the proccess of activity is gone
- the motor of scripts uses lsof command

### Example:

- Open a screen for a better investigation
- Run The Script 
- leave from the screen and put a follow up

The script will work something like this:

##### When not get any activitie:

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
##### If got the attacker:

```
+ grep 192.42.116.41
php-cgi      3634          nobody 1181u  IPv4 1012783578      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61116 (SYN_SENT)
php-cgi      3745          nobody 1185u  IPv4 1012705247      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61049 (SYN_SENT)
php-cgi      3745          nobody 1190u  IPv4 1012718921      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61055 (SYN_SENT)
php-cgi      3745          nobody 1191u  IPv4 1012711316      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61062 (SYN_SENT)
php-cgi      3745          nobody 1194u  IPv4 1012726797      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61071 (SYN_SENT)
php-cgi      3745          nobody 1195u  IPv4 1012721890      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61069 (SYN_SENT)
php-cgi      3745          nobody 1197u  IPv4 1012727803      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61074 (SYN_SENT)
php-cgi      3745          nobody 1200u  IPv4 1012730651      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61075 (SYN_SENT)
php-cgi      3745          nobody 1202u  IPv4 1012737294      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61083 (SYN_SENT)
php-cgi      3745          nobody 1203u  IPv4 1012730775      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61078 (SYN_SENT)
php-cgi      3745          nobody 1205u  IPv4 1012742870      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61091 (SYN_SENT)
php-cgi      9491          nobody 1194u  IPv4 1012762493      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61101 (SYN_SENT)
php-cgi      9491          nobody 1195u  IPv4 1012762498      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61103 (SYN_SENT)
php-cgi      9491          nobody 1198u  IPv4 1012766261      0t0  TCP 192.00.000.00:80->192.42.116.41.32:61107 (SYN_SENT)
+ '[' 0 -eq 0 ']'
++ lsof -Pni
++ grep 192.42.116.41
++ awk '{print $2}'
+ for saida in '`lsof -Pni | grep $hpot | awk {'\''print $2'\''}`'
+ lsof -p 3634
+ egrep 'cwd|DEL'
+ tee -a /home/eitest.txt
php-cgi   3634 nobody  cwd       DIR        8,4      4096          2 /
php-cgi   3634 nobody  DEL       REG        0,4            973789708 /home/accacom/public_html/index.php
php-cgi   3634 nobody  DEL       REG        0,4           1012061791 /home/accacom/public_html/index.php
php-cgi   3634 nobody  DEL       REG        0,4           1012061790 /home/accacom/public_html/index.php
+ for saida in '`lsof -Pni | grep $hpot | awk {'\''print $2'\''}`'
+ lsof -p 3745
+ egrep 'cwd|DEL'
+ tee -a /home/eitest.txt
php-cgi   3745 nobody  cwd       DIR        8,4      4096          2 /
php-cgi   3745 nobody  DEL       REG        0,4            973789708 /home/accacom/public_html/index.php
php-cgi   3745 nobody  DEL       REG        0,4           1012061791 /home/accacom/public_html/index.php
php-cgi   3745 nobody  DEL       REG        0,4           1012061790 /home/accacom/public_html/index.php
+ for saida in '`lsof -Pni | grep $hpot | awk {'\''print $2'\''}`'
The attacker was discovered take a look on: /home/eitest.txt
```


Version 1.1
- fixed bug when the return is more than one proccess
- implement a for, it will get all pid proccess and scan with lsof -p PID
- adjusted the code for a better performance
