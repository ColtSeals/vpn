 #!/bin/bash

checkdatabase

clear
echo -e "\033[5;36;40m ==========================================================\033[0m"
echo -e "\033[7;30;47m  ®Script\033[0m \033[7;30;41mEdited:\033[0m \033[0m \033[0;36;40m@Colt\033[5;37;40mSeals\033[0m"
echo -e "\033[7;30;47m  ®TELEGRAM\033[0m \033[7;30;41mCANAL:\033[0m \033[0m \033[0;36;40m@Vps\033[5;37;40mNerdologia\033[0m"
echo -e "\033[5;36;40m ==========================================================\033[0m"
echo -e "\033[7;30;46m  Para Acessar o menu Principal:\033[5;37;40m VPN \033[0m"
echo -e "\033[5;36;40m ==========================================================\033[0m"
echo -e "\033[7;30;46m  Para Acessar este menu digite:\033[5;37;40m Limitador \033[0m"
echo -e "\033[5;36;40m ==========================================================\033[0m"
echo ""
NUMBER=$(ps -x | grep -c "sleep")
if [ $NUMBER = "2" ]; then
  echo -e "\033[01;35m   •\033[01;33m ESTADO:\033[01;32m ATIVO"
  NUMBER2=$(awk 'END{print NR}' /home/DATABASE/messages.txt)
  if [ "$NUMBER2" -gt "0" ]; then
    echo -e "\033[01;35m   •\033[01;33m NOTIFICAÇÕES:\033[01;32m ● "
  else
    echo -e "\033[01;35m   •\033[01;33m NOTIFICAÇÕES:\033[01;31m ● "
  fi
  echo -e "\033[01;35m =========================================================="
echo -e "\033[01;36m║\033[1;37m1\033[1;36m║\033[5;31;40m•\033[0m\033[01;37m DESATIVAR\033[01;33m LIMITADOR."
echo -e "\033[01;36m║\033[1;37m2\033[1;36m║\033[5;31;40m•\033[0m\033[01;37m VERIFICAR NOTIFICAÇÕES."
echo -e "\033[01;36m║\033[1;37m0\033[1;36m║\033[5;31;40m•\033[0m\033[01;37m VOLTAR."
  echo -e "\033[01;35m =========================================================="
  echo -ne "\033[1;33m  OPÇÃO \033[01;32m[1-2]\033[1;37m:"; read NUMBERS
  case $NUMBERS in
    1) echo ""
          echo -e "\033[01;37mAguarde..."
          pkill -f limiter-start
          sleep 3s
          clear
          limiter-menu
          exit;;
    2) limiter-messages;;
    0) h;;
      *) limiter-menu;;
  esac
else
  echo -e "\033[01;35m   •\033[01;33m ESTADO:\033[01;31m DESATIVADO"
  NUMBER2=$(awk 'END{print NR}' /home/DATABASE/messages.txt)
  if [ "$NUMBER2" -gt "0" ]; then
    echo -e "\033[01;35m   •\033[01;33m NOTIFICAÇÕES:\033[01;32m ●"
  else
    echo -e "\033[01;35m   •\033[01;33m NOTIFICAÇÕES:\033[01;31m ●"
  fi
  echo -e "\033[01;35m =========================================================="
echo -e "\033[01;36m║\033[1;37m1\033[1;36m║\033[5;31;40m•\033[0m\033[01;37m DESATIVAR\033[01;33m LIMITADOR."
echo -e "\033[01;36m║\033[1;37m2\033[1;36m║\033[5;31;40m•\033[0m\033[01;37m VERIFICAR NOTIFICAÇÕES."
echo -e "\033[01;36m║\033[1;37m0\033[1;36m║\033[5;31;40m•\033[0m\033[01;37m VOLTAR."
  echo -e "\033[01;35m =========================================================="
  echo -ne "\033[1;33m  OPÇÃO \033[01;32m[1-2]\033[1;37m:"; read NUMBERS
  case $NUMBERS in
    1) echo ""
          echo -e "\033[01;37mAguarde..."
          screen -dmS screen limiter-start
          sleep 3s
          clear
          limiter-menu
          exit;;
    2) limiter-messages;;
    0) h;;
      *) limiter-menu;;
  esac
fi
