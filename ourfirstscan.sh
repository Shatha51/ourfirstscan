#/usr/bin
cat << "EOF"


		 ___-----------___
           __--~~                 ~~--__
       _-~~                             ~~-_
    _-~                                     ~-_
   /              ourfirstscan                 \
  |                                             |
 |                                               |
 |                                               |
|                                                 |
|                                                 |
|                                                 |
 |                                               |
 |  |    _-------_               _-------_    |  |
 |  |  /~         ~\           /~         ~\  |  |
  ||  |             |         |             |  ||
  || |               |       |               | ||
  || |              |         |              | ||
  |   \_           /           \           _/   |
 |      ~~--_____-~    /~V~\    ~-_____--~~      |
 |                    |     |                    |
|                    |       |                    |
|                    |  /^\  |                    |
 |                    ~~   ~~                    |
  \_         _                       _         _/
    ~--____-~ ~\                   /~ ~-____--~
         \     /\                 /\     /
          \    | ( ,           , ) |    /
           |   | (~(__(  |  )__)~) |   |
            |   \/ (  (~~|~~)  ) \/   |
             |   |  [ [  |  ] ]  /   |
              |                     |
               \                   /
                ~-_             _-~
                   ~--___-___--~

hi dear my first scanning tool is on your hand I wish you enjoy it
by : Dura51
EOF
if [ $(whoami) != "root" ]; then
echo  "\033[1;31mBe root please\033[0m"
else
domain=$1
if [ -z $1  ]; then
echo "\033[1;32mEnter your target domain\033[0m"
exit
else
echo "\033[1;33m........[We are working on your $domain]........\033[0m"
sbanner=$(curl -i $domain)
echo "\033[1;33m........Your domain banner........\033[0m"
echo "\033[1;31m$sbanner\033[0m"
echo "\033[1;31m........We are scanning your domain with Nmap........\033[0m"
touch scan.txt && gnome-terminal -e "tail -F scan.txt"
nscan=$(nmap -sS -O -oX nmap.xml $domain > scan.txt)
echo "\033[1;31m........[scanning $domain with nikto]........\033[0m"
sleep 5
touch report.txt && gnome-terminal -e "tail -F scan.txt"
scan=$(nikto -h $domain > report.txt)
echo "\033[1;32m........Done........\033[0m"
fi
fi
