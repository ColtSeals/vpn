#!/bin/bash

function CTRL() 
{
vpn
exit
}
trap CTRL SIGINT

DATABASE="/home/DATABASE/users.db"
 
while true; do
  clear
  echo ""
  echo -e " \033[01;37;44m USUARIOS      CONEXÃO/LIMITE     TEMPO DE CONEXÃO     STATUS \033[0m"
  echo ""
  cat $DATABASE | sort | while read DB; do
  	MONITORING3=$(echo $DB | cut -d " " -f3)
    MONITORING1=$(echo $DB | cut -d " " -f1)
    MONITORING2=$(grep "$DB" /etc/openvpn/openvpn-status.log | wc -l)	
    if [ "$MONITORING2" -gt "0" ]; then
    	TIME=$(ps -o etime $(ps -u $MONITORING1 |grep sshd |awk 'NR==1 {print $1}')|awk 'NR==2 {print $1}')
		
      echo -ne " \033[01;33m"; printf '%-21s%-16s%-7s%s' " $MONITORING1" "$MONITORING2/$MONITORING3 " "$TIME"; echo -e "          \033[01;32m ONLINE" 
    else
      echo -ne " \033[01;33m"; printf '%-21s%-16s%-7s%s' " $MONITORING1" "$MONITORING2/$MONITORING3 " "00:00"; echo -e "          \033[01;31m OFFLINE" 
    fi
    echo -e "\033[01;30m --------------------------------------------------------------"
  done
  echo ""
  echo -e "\033[01;36m APERTE CTRL+C PARA VOLTAR AO MENU..."
  sleep 10s
done


  
  
